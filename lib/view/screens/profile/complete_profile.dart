import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/profile/content_type.dart';
import 'package:myapp/view/screens/profile/profile_info.dart';
import 'package:myapp/view/screens/profile/role.dart';
import 'package:myapp/view/screens/profile/team_size.dart';

class CompleteProfileScreen extends StatefulWidget {
  CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  int activeIndex = 0;

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

  List<Widget> formSection = [ProfileRole(), const TeamSize(),const ContentType(),const ProfileInfo()];
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
              vertical: getResponsiveHeight(10)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                // color: AppColor.primaryColor,
                child: Row(
                  children: [
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            AppColor.btnInputColor),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      icon: const Icon(Icons.arrow_left_rounded),
                      onPressed: () => {
                      if(activeIndex > 0)
                        pageController.animateToPage(
                          activeIndex - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                      },
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return Container(
                          width: 43,
                          height: 5,
                          margin: const EdgeInsets.only(left: 3),
                          decoration: BoxDecoration(
                            color: activeIndex == index
                                ? AppColor.primaryColor
                                : AppColor.primaryColor.withOpacity(.40),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      }),
                    ))
                  ],
                ),
              ),
              SizedBox(height: getResponsiveHeight(20)),
              TitleAndDescription(
                title: sectionTitle[activeIndex]['title'],
                description: sectionTitle[activeIndex]['description'],
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  controller: pageController,
                  children: formSection,
                ),
              ),
              //const Spacer(),
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
                  onPressed: () {
                    pageController.animateToPage(
                      pageController.page!.toInt() + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    'Next',
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
    );
  }
}

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription({
    super.key,
    required this.title,
    required this.description,
  });

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: getResponsiveFontSize(22), fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          textAlign: TextAlign.center,
          description,
          style: TextStyle(
              fontSize: getResponsiveFontSize(15),
              color: AppColor.descriptionColor),
        ),
      ],
    );
  }
}
