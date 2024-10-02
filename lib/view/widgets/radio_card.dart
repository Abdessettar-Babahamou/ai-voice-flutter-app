import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class RadioCaed extends StatelessWidget {
  const RadioCaed({
    super.key,
    required this.title,
    required this.value,
    required this.onclick,
    required this.activeValue,
  });

  final String title;
  final int value;
  final VoidCallback onclick;
  final int activeValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: getResponsiveWidth(10),
            vertical: getResponsiveWidth(4)),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColor.btnInputColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: getResponsiveFontSize(15), color: Colors.white),
            ),
            const Spacer(),
            Radio(
              value: value,
              groupValue: activeValue,
              onChanged: (int? value) {},
            ),
          ],
        ),
      ).animate().fade(
          duration: const Duration(milliseconds: 300),
          delay: Duration(milliseconds: 300 * value)),
    );
  }
}
