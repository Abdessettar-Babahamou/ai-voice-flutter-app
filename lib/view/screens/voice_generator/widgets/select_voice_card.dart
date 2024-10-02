import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class SelectVoiceCard extends StatelessWidget {
  const SelectVoiceCard({
    super.key,
    required this.voiceName,
    required this.voiceLanguage,
    required this.onClick,
    this.isSelected = false,
    this.iconBg = Colors.blue,
  });

  final String voiceName, voiceLanguage;

  final VoidCallback onClick;

  final Color iconBg;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(getResponsiveWidth(8)),
        alignment: Alignment.center,
        // margin: EdgeInsets.only(bottom: getResponsiveHeight(12)),
        decoration: BoxDecoration(
            color: AppColor.btnInputColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                width: 2,
                color: isSelected
                    ? AppColor.primaryColor
                    : AppColor.btnInputColor)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: getResponsiveWidth(60),
              height: getResponsiveWidth(60),
              padding: EdgeInsets.all(getResponsiveWidth(10)),
              decoration: BoxDecoration(
                color: iconBg,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "assets/images/voice-1.png",
                width: getResponsiveWidth(40),
                height: getResponsiveWidth(40),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: getResponsiveHeight(10)),
            Text(
              voiceName,
              style: TextStyle(
                fontSize: getResponsiveFontSize(12),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: getResponsiveHeight(4)),
            Text(
              voiceLanguage,
              style: TextStyle(
                fontSize: getResponsiveFontSize(12),
                color: AppColor.descriptionColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
