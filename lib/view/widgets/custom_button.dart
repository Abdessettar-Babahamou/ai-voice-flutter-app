import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final VoidCallback? onPressed;
  final double borderRadius;
  final bool iconExist;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final Color borderColor;

  final bool isDisabled;

  const CustomButton({
    super.key,
    this.backgroundColor = AppColor.primaryColor,
    this.textColor = Colors.white,
    required this.text,
    required this.onPressed,
    this.borderRadius = 10,
    required this.iconExist,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.borderColor = AppColor.primaryColor,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return SizedBox(
        width: double.infinity,
        child: FilledButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(backgroundColor),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius),
                ),
              ),
            ),
            side: WidgetStatePropertyAll(
              BorderSide(
                color: borderColor,
                width: 1,
              ),
            ),
          ),
          onPressed: isDisabled ? null : onPressed,
          child: Row(
            children: [
              iconExist
                  ? Icon(
                      icon,
                      color: iconColor,
                      size: getResponsiveFontSize(iconSize ?? 20),
                    )
                  : const SizedBox(),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textColor,
                      fontSize: getResponsiveFontSize(15),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ));
  }
}
