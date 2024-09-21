// Suggested code may be subject to a license. Learn more: ~LicenseLog:2873554090.
import 'package:flutter/material.dart';

class SizeResponsive {
   static late  double secreenWidth, secreenHeight, inch;



  ///Check if the screen is a mobile device
  bool get isMobile => secreenWidth < 600;

  ///Check if the screen is a tablet device
  bool get isTablet => secreenWidth >= 600 && secreenWidth < 1024;

  ///Check if the screen is a desktop device
  bool get isDesktop => secreenWidth >= 1024;

  static init(BuildContext context){
    final size = MediaQuery.of(context).size;
    secreenWidth=size.width;
    secreenHeight=size.height;
  }
}
double getResponsiveWidth(double width){
  double widthtSecreen=SizeResponsive.secreenWidth;
  return ((width/414.0)*widthtSecreen);
}

double getResponsiveHeight(double height){
  double heightSecreen=SizeResponsive.secreenHeight;
  return ((height/896.0)*heightSecreen);
}

double getResponsiveFontSize(double width){
  double widthtSecreen=SizeResponsive.secreenWidth;
  return ((width/414.0)*widthtSecreen);
}