import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide.none,
);

var outlineActiveInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    width: 2,
    color: AppColor.primaryColor,
  ),
);

var inputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: getResponsiveFontSize(15)),
    enabledBorder: otpOutlineBoeder,
    focusedBorder: otpOutlineBoeder,
    border: otpOutlineBoeder);

OutlineInputBorder otpOutlineBoeder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: AppColor.descriptionColor));

// data

List sectionTitle = [
  {
    "title": "Your Role? 🌟",
    "description":
        "Choose the role that best fits you. Sonic AI will adapt to your creative style."
  },
  {
    "title": "Team Size? 👥",
    "description":
        "Select your team size to customize your Sonic AI experience."
  },
  {
    "title": " Content Type? 🎙️",
    "description":
        "Choose all the content types you plan to create. Your selection will shape your Sonic AI experience."
  },
  {
    "title": " Complete Your Profile 👤",
    "description":
        "Make your profile uniquely yours - it's your creative canvas!"
  },
];

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
List contentType = [
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
List voiceItem = [
  {
    "image": "assets/images/voice-1.png",
    "title": "Gladys",
    "description": "Hindi",
    "duration": "2:30",
    "color": const Color(0xfffeeab1)
  },
  {
    "image": "assets/images/voice_2.png",
    "title": "Francisco",
    "description": "English",
    "duration": "0:30",
    "color": const Color(0xffdbd1fb)
  },
  {
    "image": "assets/images/voice-1.png",
    "title": "Colleen",
    "description": "Chinese",
    "duration": "1:30",
    "color": const Color(0xffdbd1fb)
  },
];

final List cardColors = [
  const Color(0xFFFFADDB),
  const Color(0xFFC2A5FF),
  const Color(0xFF9CFFAC),
  const Color(0xFFC2A5FF),
  const Color(0xFFfee7a7),
  const Color(0xFFd6ccfb),
  const Color(0xFFfee7a7),
];
