import 'package:flutter/material.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class WaveItem extends StatelessWidget {
  const WaveItem(
      {super.key, required this.color, this.rotation = 0, this.scale = 1});
  final double rotation;
  final double scale;
  final Color color;

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);

    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: rotation,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: color,
            // shape: BoxShape.circle,

            borderRadius: BorderRadius.only(
              topRight: Radius.circular(getResponsiveWidth(70)),
              bottomLeft: Radius.circular(getResponsiveWidth(70)),
              topLeft: Radius.circular(getResponsiveWidth(100)),
              bottomRight: Radius.circular(
                getResponsiveWidth(100),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
