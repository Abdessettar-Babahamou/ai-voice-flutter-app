import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/view/screens/voice_generator/script_to_speech.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceController extends GetxController with GetTickerProviderStateMixin {
  // create instans for the controller to avoid use Get.find every time
  static VoiceController get to => Get.find(); // add this line

  // rotation animiation controller fo the wave animations
  late AnimationController _rotationController;
  // scale animiation controller fo the wave animations
  late AnimationController _scaleController;

// get methods for the rotation and scale controllers
  AnimationController? get rotationController => _rotationController;

  AnimationController? get scaleController => _scaleController;

  static const _kRotationDuration = Duration(seconds: 5);
  static const _kToggleDuration = Duration(seconds: 2);
  // variables to store the value of the animation
  late RxDouble rotation = 0.0.obs;
  late RxDouble scale = 1.0.obs;
  // two functions trigger when the rotate and scale animations starts
  void _updateRotation() => rotation.value = rotationController!.value * 2 * pi;
  void _updateScale() => scale.value = (scaleController!.value * 0.2) + 0.85;

// to convert speech to text
  late SpeechToText _speechToText;
  // chek if thi usr accept use the mic or not
  bool _speechEnabled = false;
  late PermissionStatus _permissionStatus;
  String _lastWords = '';
// tracking change of the listening
  late RxBool isListening = false.obs;
//  record time
  int time = 0;

// timer for the record audio
  late Timer _timer;
// the duration of the audio file after is created
  int finalRecordTime = 0;
  late TextEditingController textEditingController;

  @override
  void onInit() {
    super.onInit();
    _rotationController =
        AnimationController(vsync: this, duration: _kRotationDuration)
          ..addListener(() {
            _updateRotation();
          });

    _scaleController =
        AnimationController(vsync: this, duration: _kToggleDuration)
          ..addListener(() {
            _updateScale();
          });

    textEditingController = TextEditingController();
    _speechToText = SpeechToText();
  }

// Initialize the speech and request the mic permission

  Future<void> _initSpeech() async {
    try {
      _speechEnabled = await _speechToText.initialize(
        onStatus: _statusListener,
        onError: errorListener,
      );
    } catch (e) {
      if (kDebugMode) {
        print("Error initializing speech: $e");
      }
      // Get.snackbar('Error', "Please check your mic and internet"); // Fixed typo
    }
  }

  void listenToSpeech() async {
    try {
      if (!isListening.value) {
        await _initSpeech();
        if (_speechEnabled) {
          isListening.value = true;
          startAndStopAnimation();
          _startListening();
          startTimer();
        } else {
          Get.snackbar(
              'Error', 'Please make sure the mic is activated and try again');
          _permissionStatus = await Permission.microphone.request();
          if (_permissionStatus == PermissionStatus.granted) {
          } else {
            Get.snackbar('Error', 'Please make sure the mic is activated ');
          }
        }
      } else {
        isListening.value = false;
        startAndStopAnimation();
        resetTimer();
        _stopListening();
      }
    } catch (e) {
      Get.snackbar(
          'Error', 'Please make sure the mic is activated and try again');
    }
  }

  void _startListening() async {
    await _speechToText.listen(
        onResult: _onSpeechResult,
        listenOptions: SpeechListenOptions(cancelOnError: true));
  }

  void _stopListening() async {
    await _speechToText.stop();
  }

  void _statusListener(String status) {
    if (status == 'done') {
      resetTimer();
      isListening.value = false;
      startAndStopAnimation();
    }
  }

  void errorListener(SpeechRecognitionError error) async {
    resetTimer();
    isListening.value = false;
    startAndStopAnimation();

    Get.snackbar(
        'Error', 'Please make sure the mic is activated and you are speeking');
  }

//  when the record is done set the text fo the textformfield
  void _onSpeechResult(SpeechRecognitionResult result) {
    _lastWords = result.recognizedWords;
    textEditingController.text = _lastWords;
    if (result.finalResult) {
      Get.to(() => const ScriptToSpeech());
    }
  }

  void startAndStopAnimation() {
    if (isListening.value) {
      _rotationController.repeat(reverse: true);
      _scaleController.repeat(reverse: true);
    } else {
      _rotationController.stop();
      _scaleController.stop();
    }
  }

  // We must call this function to begin the timer (which determines the record's duration) when the record is started.
  void startTimer() {
    if (isListening.value) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timeer) {
        time++;
      });
    } else {
      resetTimer();
    }
  }

//  This function is called to stop the timer when the record is finished.
  void resetTimer() {
    _timer.cancel();
    finalRecordTime = time;
    time = 0;
  }

  @override
  void onClose() async {
    textEditingController.dispose();
    _rotationController.dispose();
    _scaleController.dispose();
    await _speechToText.stop();
    await _speechToText.cancel();
    super.onClose();
  }
}
