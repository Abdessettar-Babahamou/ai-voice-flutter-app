import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final List<String> icons = [
    "assets/images/home.svg",
    "assets/images/chart.svg",
    "assets/images/setting.svg",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: getResponsiveHeight(10),
          horizontal: getResponsiveWidth(20)),
      padding: EdgeInsets.symmetric(vertical: getResponsiveHeight(10)),
      decoration: BoxDecoration(
        color: AppColor.btnInputColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          return NavBarItem(
              icon: icons[index],
              isActive: index == selectedIndex,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              });
        }),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String icon;
  final bool isActive;
  final Function() onTap;

  const NavBarItem({
    super.key,
    required this.icon,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        icon,
        width: getResponsiveWidth(30),
        height: getResponsiveWidth(30),
        colorFilter: ColorFilter.mode(
            isActive ? AppColor.primaryColor : AppColor.descriptionColor,
            BlendMode.srcIn),
      ),
    );
  }
}
