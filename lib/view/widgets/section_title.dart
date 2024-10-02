import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getResponsiveFontSize(15),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: Row(
            children: [
              Text(
                'See all',
                style: TextStyle(
                  fontSize: getResponsiveFontSize(13),
                  color: AppColor.primaryColor,
                ),
              ),
              SizedBox(width: getResponsiveWidth(4)),
              Icon(
                Icons.arrow_forward_ios,
                size: getResponsiveFontSize(13),
                color: AppColor.primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
