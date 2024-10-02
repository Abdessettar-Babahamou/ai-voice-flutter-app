import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/constants/constants.dart';
import 'package:myapp/controller/player_controller.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/voice_generator/widgets/select_voice_card.dart';
import 'package:myapp/view/widgets/custom_app_bar.dart';
import 'package:myapp/view/widgets/voice_animation.dart';

class SelectVoice extends StatelessWidget {
  const SelectVoice({super.key});

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    PlayerController controller = Get.put<PlayerController>(PlayerController());
    // print(controller.getLanguages());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getResponsiveWidth(50)),
        child: const CustomAppBar(
          title: 'Select Voice',
          titleIsExist: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GetBuilder<PlayerController>(
              id: 'lang-list',
              builder: (context) {
                return Expanded(
                  child: controller.langugesLoaded
                      ? GridView.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.8,
                          children: List.generate(6, (index) {
                            return SelectVoiceCard(
                              voiceName: "Nathan",
                              voiceLanguage: controller.mapLanguages[
                                      controller.voices[index]['locale']] ??
                                  '',
                              isSelected:
                                  controller.selectedLanguagesIndex == index,
                              iconBg: cardColors[index],
                              onClick: () {
                                controller.selectedLanguagesIndex = index;
                                controller.selectLanguage(
                                    controller.voices[index]['locale'], index);
                              },
                            );
                          }),
                        )
                      : const Text("isloading"),
                );
              },
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12)),
                onPressed: () {
                  Get.dialog(
                    barrierDismissible: false,
                    AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: VoiceAnimation(),
                          ),
                          Text(
                            'Generating Audio...',
                            style:
                                TextStyle(fontSize: getResponsiveFontSize(17)),
                          ),
                          Text(
                            'Please wait while your audio is being processed. This may take a few moments.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: getResponsiveFontSize(13),
                                color: AppColor.descriptionColor),
                          ),
                          TextButton(
                              onPressed: () => {}, child: const Text('Cancel'))
                        ],
                      ),
                    ),
                  );
                  controller.createAudioFile();
                },
                child: Text(
                  'Generate Speech',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
