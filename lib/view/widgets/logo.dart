import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return RichText(
      text: TextSpan(
          text: 'Sonic',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: getResponsiveFontSize(34)),
          children: [
            const WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: SizedBox(width: 10)),
            TextSpan(
                text: 'AI',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: getResponsiveFontSize(34),color: AppColor.primaryColor))
          ]),
    );
  }
}