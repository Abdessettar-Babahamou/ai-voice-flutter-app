import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/voice_generator/voice_generator_screen.dart';

class AiGeneratorSection extends StatelessWidget {
  const AiGeneratorSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        AiGeneratorCard(
          title: "AI Voice Generator",
          description: "Let’s see what can I do for you?",
          icon: "assets/images/microphone.svg",
          btnText: "Record",
        ),
        AiGeneratorCard(
          title: "AI Voice Changer",
          description: "Let’s see what can I do for you?",
          icon: "assets/images/play_circle1.svg",
          btnText: "Create New",
        ),
      ],
    );
  }
}

class AiGeneratorCard extends StatelessWidget {
  const AiGeneratorCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.btnText,
  });

  final String title, description, icon, btnText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - getResponsiveWidth(25),
      margin: EdgeInsets.only(right: getResponsiveWidth(5)),
      padding: EdgeInsets.all(getResponsiveWidth(16)),
      decoration: BoxDecoration(
        color: AppColor.btnInputColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(getResponsiveWidth(10)),
            decoration: BoxDecoration(
              color: AppColor.btnGryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              icon,
              width: getResponsiveWidth(24),
              height: getResponsiveWidth(24),
            ),
          ),
          SizedBox(height: getResponsiveHeight(12)),
          Text(
            title,
            style: TextStyle(
              fontSize: getResponsiveFontSize(15),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: getResponsiveHeight(8)),
          Text(
            description,
            style: TextStyle(
              fontSize: getResponsiveFontSize(12),
              color: AppColor.descriptionColor,
            ),
          ),
          SizedBox(height: getResponsiveHeight(16)),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VoiceGeneratorScreen()),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                foregroundColor: AppColor.btnInputColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: getResponsiveHeight(12)),
                child: Text(btnText,
                    style: TextStyle(
                        fontSize: getResponsiveFontSize(13),
                        color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
