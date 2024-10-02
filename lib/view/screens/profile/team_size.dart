import 'package:flutter/material.dart';
import 'package:myapp/constants/constants.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/profile/widgets/title_and_description.dart';
import 'package:myapp/view/widgets/radio_card.dart';

class TeamSize extends StatefulWidget {
  const TeamSize({super.key});

  @override
  State<TeamSize> createState() => _TeamSizeState();
}

class _TeamSizeState extends State<TeamSize> {
  int activeValue = 0;

  void handleOnclik(int? value) {
    setState(() {
      activeValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: getResponsiveWidth(20),
            horizontal: getResponsiveWidth(5)),
        child: Column(
          children: [
            TitleAndDescription(
              title: sectionTitle[1]['title'],
              description: sectionTitle[1]['description'],
            ),
            SizedBox(height: getResponsiveHeight(20)),
            ...List.generate(
              tesmSizeItem.length,
              (index) {
                return RadioCaed(
                    title: tesmSizeItem[index]["title"],
                    value: index,
                    onclick: () => handleOnclik(index),
                    activeValue: activeValue);
              },
            )
          ],
        ),
      ),
    );
  }
}
