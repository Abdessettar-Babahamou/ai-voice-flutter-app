import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/widgets/custom_back_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actionIconExist = false,
    this.actionIcon,
    this.titleIsExist = false,
  });

  final String title;
  final bool titleIsExist;
  final bool actionIconExist;
  final IconData? actionIcon;

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getResponsiveWidth(12), vertical: 10),
      decoration: const BoxDecoration(
        color: AppColor.primaryBgColor,
      ),
      child: Row(
        children: [
          const CustomBackButton(),
          titleIsExist
              ? Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(16),
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : const SizedBox(),
          actionIconExist
              ? IconButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const WidgetStatePropertyAll(AppColor.btnInputColor),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  icon: Icon(actionIcon, color: Colors.white),
                  onPressed: () {},
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
