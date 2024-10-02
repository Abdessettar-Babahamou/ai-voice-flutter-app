import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/profile/content_type.dart';
import 'package:myapp/view/screens/profile/profile_info.dart';
import 'package:myapp/view/screens/profile/role.dart';
import 'package:myapp/view/screens/profile/team_size.dart';

class CompleteProfileScreent extends StatefulWidget {
  const CompleteProfileScreent({super.key});

  @override
  State<CompleteProfileScreent> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreent> {
  int activeIndex = 0;

  List<Widget> formSection = [
    const ProfileRole(),
    const TeamSize(),
    const ContentType(),
    const ProfileInfo()
  ];
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: activeIndex);
  }

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryBgColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getResponsiveWidth(20),
              vertical: getResponsiveHeight(30)),
          child: SizedBox(
            height: 600,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: getResponsiveHeight(20)),
                // TitleAndDescription(
                //   title: sectionTitle[activeIndex]['title'],
                //   description: sectionTitle[activeIndex]['description'],
                // ),
                // TitleAndDescription(
                //   title: sectionTitle[activeIndex]['title'],
                //   description: sectionTitle[activeIndex]['description'],
                // ),
                Expanded(
                  child: PageView(
                    onPageChanged: (index) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    controller: pageController,
                    children: formSection,
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(AppColor.primaryColor),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      activeIndex < formSection.length - 1
                          ? 'Next'
                          : 'Complete',
                      style: TextStyle(
                          fontSize: getResponsiveFontSize(16),
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
