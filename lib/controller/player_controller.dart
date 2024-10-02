import 'dart:async';
import 'dart:io';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:myapp/controller/voice_controller.dart';
import 'package:myapp/view/screens/voice_generator/voice_player.dart';
import 'package:translator/translator.dart';

class PlayerController extends GetxController {
  // create instans for the controller to avoid use Get.find every time
  static PlayerController get to => Get.find(); // add this line

  final VoiceController _voiceController = VoiceController.to;

//  record time
  int time = 0;

// timer for the record audio
  // the duration of the audio file after is created
  int finalRecordTime = 0;

  // ******************* use fo player Audio************

  late FlutterTts flutterTts;
  // use to trnslate the text using google api
  final translator = GoogleTranslator();
  // set to tre when the audio player is started
  late bool isPlaying = false;
  // set to tre when the audio player is pused
  late bool isPused = false;
  // set true when the audio file is generating
  late bool isGenerating = false;
// trak the change of the duration of the audio file whhen the player is started
  int activeVoiceTime = 0;
// default selected language
  String selectedLanguage = "en-US"; // Fixed typo

  int lastWordSpeek = 0;

  late AudioPlayer player; // Create a player

// the location of the audio file after is created
  String finalSavedAudioLocation = '';

// set to true when the audio file is created
  late bool isDone = false;
  // available languages
  Map<String, String> mapLanguages = {
    'ar': 'Arabic',
    'fr-FR': 'French', // Fixed typo
    'en-US': 'English',
    'es-US': 'Spanish',
    'hi-IN': 'Hindi',
  };
  // available languages
  List<String> languages = [];
  // store all available voices
  List<dynamic> voices = [];
  // set the selcted language
  String? selectedLanguages;
  // set the selected language index
  int selectedLanguagesIndex = 0;
// when we load the languages
  bool langugesLoaded = false;

// Initialize all variables
  @override
  void onInit() {
    flutterTts = FlutterTts();
    player = AudioPlayer();

    super.onInit();
  }

  @override
  void onReady() async {
    await loadLanguagesAndVoices();
    super.onReady();
  }

// load supported languages
  Future<void> loadLanguagesAndVoices() async {
    try {
      List<dynamic> availableLanguages = await flutterTts.getLanguages;
      languages = availableLanguages
          .where((language) => mapLanguages.keys.contains(language))
          .map((lang) => lang as String)
          .toList();
      await flutterTts.getVoices.then((value) {
        voices = value
            .where((x) => mapLanguages.keys.contains(x['locale']))
            .toList();
      });
    } catch (e) {
      Get.snackbar('Error', "Plaese check you mic and internet");
    } finally {
      langugesLoaded = true;
      update(['lang-list']);
    }
  }

// function to change selected voice is used in the SelectVoiceCard
  void selectLanguage(String lang, int voiceIndex) {
    selectedLanguage = lang;
    flutterTts.setVoice({
      'name': voices[voiceIndex]['name'],
      'locale': voices[voiceIndex]['locale']
    });
    update(['lang-list']);
  }

  Future<void> stop(String text) async {
    await flutterTts.stop();
  }

// convert text to audio file
  Future<void> createAudioFile() async {
    try {
      isGenerating = true;
      update();
      // the name of the audio file
      String fullFileName =
          'tts_audio${DateTime.now().microsecondsSinceEpoch.toString()}.wav';
      // translate the text to the selected language using Google Api
      String textTranslated = await textTranslate();
      // convert the translated text into audio file
      ////*****/ you can devlope this app and use firebease or any DataBase to store the audio files for all users
      ///
      await flutterTts.awaitSynthCompletion(true);
      var response =
          await flutterTts.synthesizeToFile(textTranslated, fullFileName);
      // await Future.delayed(
      //     const Duration(seconds: 3)); //wait to save ti file in the device
      if (response == 1) {
        finalSavedAudioLocation = '/storage/emulated/0/music/$fullFileName';
        // get the duration of the audio file
        final duration = await player.setAudioSource(
          AudioSource.uri(Uri.file(finalSavedAudioLocation)),
        );
        if (duration != null && duration.inSeconds > 0) {
          // set the duration of the audio file
          finalRecordTime = duration.inSeconds;
          Get.back();
          Get.snackbar("Audio File", "Your audio file has been generated");
          Get.to(() => const VoicePlayer());
        } else {
          // if the duration is 0 we we will remove the created audio file
          await deleteFile(File(finalSavedAudioLocation));
          Get.back();
          Get.snackbar(
              "Audio File", "Kindly talk more. Your sentence is quite brief.");
        }
      } else {
        Get.snackbar("Error",
            "Failed to create the audio file please chaeck you internet and try again");
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error', "please check your internet and try again");
    } finally {
      isGenerating = false;
    }
  }

  void playAudio() async {
    try {
      _listenToPlayerPosition();
      _listenToPlayerState();
      if (player.playing) {
        await player.pause();
        isPused = true;
        isPlaying = false;
        update(['btn-play']);
      } else {
        if (isPused) {
          isPlaying = true;
          update(['btn-play']);
          await player.play();
          isPused = false;
        } else {
          activeVoiceTime = 0;
          isPlaying = true;
          update(['btn-play']);
          await player.setAudioSource(
            AudioSource.uri(Uri.file(finalSavedAudioLocation)),
          );
          await player.play();
        }
      }
    } catch (e) {
      //  print("Error during playback: $e");
      Get.snackbar("Error", "please try again");

      isPlaying = false;
      update(['btn-play']);
    }
  }

//  listen to player possition change
  void _listenToPlayerPosition() {
    player.positionStream.listen((duration) {
      activeVoiceTime = duration.inSeconds;
      update(['player-id', 'slider-state']);
    });
  }

//  listen to state of the player
  void _listenToPlayerState() {
    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        isPlaying = false;
        update(['btn-play']);
        player.stop();
      }
    });
  }

// helper function to translate the text for language to other
  Future<String> textTranslate() async {
    var translation = await translator.translate(
        _voiceController.textEditingController.text,
        to: selectedLanguage.split("-")[0]);
    return translation.text;
  }

  Future<void> deleteFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      // Error in getting access to the file.
    }
  }

  @override
  void onClose() {
    flutterTts.stop();
    player.stop();
    super.onClose();
  }
}
