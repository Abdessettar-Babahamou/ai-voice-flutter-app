import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription({
    super.key,
    required this.title,
    required this.description,
  });

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: getResponsiveFontSize(22), fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          textAlign: TextAlign.center,
          description,
          style: TextStyle(
              fontSize: getResponsiveFontSize(15),
              color: AppColor.descriptionColor),
        ),
      ],
    );
  }
}
