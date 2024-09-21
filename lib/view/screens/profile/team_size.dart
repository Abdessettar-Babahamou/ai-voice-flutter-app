import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/widgets/radio_card.dart';

class TeamSize extends StatefulWidget {
  const TeamSize({Key? key}) : super(key: key);

  @override
  State<TeamSize> createState() => _TeamSizeState();
}

class _TeamSizeState extends State<TeamSize> {
  int activeValue = 0;

  List tesmSizeItem = [
    {
      "title": "Solo",
    },
    {
      "title": "1 - 10 Employees",
    },
    {
      "title": "11 - 50 Employees",
    },
    {
      "title": "51 - 100 Employees",
    },
    {
      "title": "101 - 500 Employees",
    },
    {
      "title": "500+ Employees",
    },
  ];

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
          children: List.generate(
            tesmSizeItem.length,
            (index) {
              return RadioCaed(
                  title: tesmSizeItem[index]["title"],
                  value: index,
                  onclick: () => handleOnclik(index),
                  activeValue: activeValue);
            },
          ),
        ),
      ),
    );
  }
}


