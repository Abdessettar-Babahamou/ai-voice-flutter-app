import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/widgets/radio_card.dart';

class ContentType extends StatefulWidget {
  const ContentType({Key? key}) : super(key: key);

  @override
  State<ContentType> createState() => _TeamSizeState();
}

class _TeamSizeState extends State<ContentType> {
  int activeValue = 0;

  List tesmSizeItem = [
    {
      "title": "Marketing & Ads",
    },
    {
      "title": "YouTube Videos & Shorts",
    },
    {
      "title": "Education",
    },
    {
      "title": "Social Media",
    },
    {
      "title": "Podcasts",
    },
    {
      "title": "Personal Only",
    },
      {
      "title": "Other",
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


