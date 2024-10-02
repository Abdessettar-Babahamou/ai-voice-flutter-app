import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class VoiceAnimation extends StatelessWidget {
  VoiceAnimation({super.key});

  final List<int> duration = [500, 600, 700, 800, 900];

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(5, (index) {
        return VoiceAnimationItem(
          color: AppColor.primaryColor,
          width: getResponsiveWidth(5),
          height: getResponsiveWidth(25) > 90 ? 90 : getResponsiveWidth(25),
          duration: duration[index],
        );
      }),
    );
  }
}

class VoiceAnimationItem extends StatefulWidget {
  final Color color;
  final double width;
  final double height;
  final int duration;

  const VoiceAnimationItem({
    super.key,
    required this.color,
    required this.width,
    required this.height,
    required this.duration,
  });

  @override
  // ignore: library_private_types_in_public_api
  _VoiceAnimationItemState createState() => _VoiceAnimationItemState();
}

class _VoiceAnimationItemState extends State<VoiceAnimationItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _curvedAnimation;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    );
    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _animation =
        Tween<double>(begin: 4, end: widget.height).animate(_curvedAnimation)
          ..addListener(() {
            setState(() {});
          });
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: _animation.value,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
