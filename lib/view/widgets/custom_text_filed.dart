import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/constants/constants.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class CustomTextFiled extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final IconData? suffixIcon;
  final IconData prefixIcon;

  const CustomTextFiled(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller,
      this.suffixIcon,
      required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        style: TextStyle(
          fontSize: getResponsiveWidth(14) > 60 ? 60 : getResponsiveWidth(14),
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: getResponsiveWidth(20),
              vertical: getResponsiveWidth(10)),
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize:
                  getResponsiveWidth(14) > 60 ? 60 : getResponsiveWidth(14)),
          border: outlineInputBorder,
          filled: true,
          fillColor: AppColor.btnInputColor,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineActiveInputBorder,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(10)),
            child: Icon(
              prefixIcon,
              size: getResponsiveWidth(30) > 70 ? 70 : getResponsiveWidth(30),
            ),
          ),
          suffixIcon: obscureText
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getResponsiveWidth(10)),
                  child: Icon(
                    suffixIcon,
                    size: getResponsiveWidth(30) > 70
                        ? 70
                        : getResponsiveWidth(30),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
