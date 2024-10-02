import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getResponsiveWidth(20),
          vertical: getResponsiveHeight(10)),
      child: SafeArea(
        child: Row(
          children: [
            const CircleAvatar(
              // radius: 40,
              backgroundImage: AssetImage(
                'assets/images/Profile.png',
              ), // Replace with your image path
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Welcome back!',
                style: TextStyle(
                    fontSize: getResponsiveFontSize(20) > 30
                        ? 30
                        : getResponsiveFontSize(20),
                    color: Colors.white),
              ),
            ),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColor.btnInputColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
                size: getResponsiveFontSize(20) > 30
                    ? 30
                    : getResponsiveFontSize(20),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
