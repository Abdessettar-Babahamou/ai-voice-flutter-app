import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onClick,
  });

  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return Container(
      height: getResponsiveWidth(30),
      width: getResponsiveWidth(30),
      decoration: BoxDecoration(
          color: AppColor.btnInputColor,
          borderRadius: BorderRadius.circular(10)),
      child: IconButton(
          onPressed: onClick ?? () => Get.back(closeOverlays: true),
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColor.btnInputColor),
              padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: getResponsiveFontSize(15),
          )),
    );
  }
}
