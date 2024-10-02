import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/controller/voice_controller.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/voice_generator/select_voice.dart';
import 'package:myapp/view/widgets/custom_app_bar.dart';

class ScriptToSpeech extends GetView<VoiceController> {
  const ScriptToSpeech({super.key});

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getResponsiveWidth(50)),
        child: const CustomAppBar(
          title: 'Script to Speech',
          titleIsExist: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColor.btnGryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: controller.textEditingController,
                  style: TextStyle(fontSize: getResponsiveFontSize(20)),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration.collapsed(
                      hintText: "Enter your text here"),
                ),
              ),
            ),
            const SizedBox(height: 15),
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
                  Get.to(() => const SelectVoice());
                },
                child: Text(
                  'Select Voice',
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
