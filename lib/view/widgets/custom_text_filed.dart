 
import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/constants/constants.dart';

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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
         obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          border: outlineInputBorder,
          filled: true,
          fillColor: AppColor.btnInputColor,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineActiveInputBorder,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: obscureText ? Icon(suffixIcon) :null,
        ),
      ),
    );
  }
}
