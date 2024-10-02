import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/voice_generator/voice_generator_screen.dart';
import 'package:myapp/view/widgets/voice_animation.dart';

class HomeScriptCard extends StatelessWidget {
  const HomeScriptCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const RadialGradient(
          center: Alignment.bottomRight,
          radius: 4,
          colors: [
            Color(0xFFFFADDB),
            Color(0xFFC2A5FF),
            Color(0xFFC2A5FF),
            Color(0xFF9CFFAC),
          ],
          stops: [0, 0.39, 0.67, 1],
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getResponsiveWidth(16),
              vertical: getResponsiveWidth(15)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: getResponsiveWidth(60),
                    height: getResponsiveWidth(60),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        horizontal: getResponsiveWidth(10)),
                    decoration: BoxDecoration(
                      color: AppColor.btnInputColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: VoiceAnimation(),
                  ),
                  SizedBox(width: getResponsiveWidth(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Script to Speech',
                        style: TextStyle(
                            color: AppColor.btnInputColor,
                            fontSize: getResponsiveWidth(16),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: getResponsiveWidth(4)),
                      Text(
                        'change your voice as you wish',
                        style: TextStyle(
                          color: AppColor.btnInputColor,
                          fontSize: getResponsiveFontSize(12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: getResponsiveWidth(10)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const VoiceGeneratorScreen()),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: getResponsiveWidth(15)),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Create Now',
                    style: TextStyle(
                        fontSize: getResponsiveFontSize(13),
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
