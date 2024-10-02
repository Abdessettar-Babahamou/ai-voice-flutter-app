import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/voice_controller.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/voice_generator/script_to_speech.dart';
import 'package:myapp/view/screens/voice_generator/widgets/generator_bottom_button.dart';

class CustomVoiceBottomBar extends GetView<VoiceController> {
  CustomVoiceBottomBar({
    super.key,
  });

  final List icons = [Icons.refresh, Icons.mic, Icons.check];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: getResponsiveHeight(10),
          horizontal: getResponsiveWidth(20)),
      padding: EdgeInsets.symmetric(vertical: getResponsiveHeight(10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
            colors: [Color(0xFF3F3F3F), Color(0xFF262626)], stops: [0, 1]),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF303030), // Shadow color
            blurRadius: 15, // Blur radius
            offset: Offset(-3, -3), // Offset for the shadow
          ),
          BoxShadow(
            color: Color(0xFF303030), // Shadow color
            blurRadius: 20, // Blur radius
            offset: Offset(4, 4), // Offset for the shadow
          ),
        ],
      ),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GeneratorBottomButton(
                icon: Icons.refresh,
                onClick: () {},
              ),
              GeneratorBottomButton(
                icon: controller.isListening.value ? Icons.pause : Icons.mic,
                isInTheMidlle: true,
                onClick: () {
                  controller.listenToSpeech();
                },
              ),
              GeneratorBottomButton(
                icon: Icons.check,
                iconColor: Colors.green,
                onClick: () {
                  Get.to(() => const ScriptToSpeech());
                },
              ),
            ],
          )),
    );
  }
}
