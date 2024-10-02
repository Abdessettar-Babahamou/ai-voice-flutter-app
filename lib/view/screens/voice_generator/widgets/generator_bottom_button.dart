import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class GeneratorBottomButton extends StatelessWidget {
  const GeneratorBottomButton({
    super.key,
    required this.icon,
    this.isInTheMidlle = false,
    required this.onClick,
    this.iconColor = Colors.white,
  });

  final IconData icon;

  final Color iconColor;

  final bool isInTheMidlle;

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);

    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: isInTheMidlle
            ? getResponsiveWidth(60)
            : getResponsiveWidth(40), // Set width for the circular button
        height: getResponsiveWidth(60), // Set height for the circular button
        decoration: BoxDecoration(
          border: Border.all(
              color: isInTheMidlle
                  ? Colors.white.withOpacity(.5)
                  : Colors.white.withOpacity(.2),
              width: 1),
          shape: BoxShape.circle, // Make it circular
          color: AppColor.btnInputColor, // Button color
          gradient: const LinearGradient(
              colors: [
                Color(0xFF3F3F3F),
                Color(0xFF262626)
              ], // Define your gradient colors
              // begin: Alignment.topLeft,
              // end: Alignment.topRight,
              stops: [
                0,
                1
              ]),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF303030), // Shadow color
              blurRadius: 15, // Blur radius
              offset: Offset(-3, -3), // Offset for the shadow
            ),
            BoxShadow(
              color: Color(0xFF303030), // Shadow color
              blurRadius: 20, // Blur radius
              offset: Offset(4, 4), // Offset for the shadow
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
            size: isInTheMidlle
                ? getResponsiveFontSize(14)
                : getResponsiveFontSize(18),
          ), // Example icon
        ),
      ),
    );
  }
}
