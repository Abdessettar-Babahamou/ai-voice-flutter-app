import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class CustomElevetedButton extends StatelessWidget {
  const CustomElevetedButton({
    super.key,
    required this.title,
    required this.onClick,
    this.buttonColor = AppColor.primaryColor,
    this.iconExist = false,
    this.icon,
    this.fontSize = 16,
  });

  final String title;

  final VoidCallback onClick;

  final Color buttonColor;
  final bool iconExist;
  final String? icon;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20)),
      onPressed: onClick,
      child: Row(
        children: [
          iconExist
              ? SvgPicture.asset(
                  icon!,
                  width: getResponsiveWidth(24),
                  height: getResponsiveWidth(24),
                )
              : const SizedBox(),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: getResponsiveFontSize(fontSize),
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
