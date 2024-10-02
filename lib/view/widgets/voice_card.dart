import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/widgets/voice_animation.dart';

class VoiceCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String duration;
  final bool isSelected;
  final Color? imageBgColor;
  final Function() onTap;
  const VoiceCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.duration,
    required this.isSelected,
    required this.onTap,
    this.imageBgColor = const Color(0xfffeeab1),
  });

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return Container(
      padding: EdgeInsets.all(getResponsiveWidth(12)),
      margin: EdgeInsets.only(bottom: getResponsiveHeight(12)),
      decoration: BoxDecoration(
        color: AppColor.btnInputColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: getResponsiveWidth(60),
            height: getResponsiveWidth(60),
            padding: EdgeInsets.all(getResponsiveWidth(10)),
            decoration: BoxDecoration(
              color: imageBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              image,
              width: getResponsiveWidth(40),
              height: getResponsiveWidth(40),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: getResponsiveWidth(12)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: getResponsiveFontSize(12),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: getResponsiveHeight(4)),
              Text(
                description,
                style: TextStyle(
                  fontSize: getResponsiveFontSize(12),
                  color: AppColor.descriptionColor,
                ),
              ),
            ],
          ),
          SizedBox(width: getResponsiveWidth(12)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                !isSelected
                    ? Text(
                        duration,
                        style: TextStyle(
                          fontSize: getResponsiveFontSize(14),
                          color: AppColor.primaryColor,
                        ),
                      )
                    : VoiceAnimation(),
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColor.btnInputColor,
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(getResponsiveWidth(8)),
                  ),
                  child: SvgPicture.asset(
                      isSelected
                          ? "assets/images/pause-circle.svg"
                          : "assets/images/play_circle2.svg",
                      width: getResponsiveWidth(32),
                      height: getResponsiveWidth(32)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
