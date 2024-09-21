import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide.none,
);

var outlineActiveInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    width: 2,
    color: AppColor.primaryColor,
  ),
);

var inputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: getResponsiveFontSize(15)),
    enabledBorder: otpOutlineBoeder,
    focusedBorder: otpOutlineBoeder,
    border: otpOutlineBoeder);

OutlineInputBorder otpOutlineBoeder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: AppColor.descriptionColor));
