import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/home/home.dart';
import 'package:myapp/view/screens/profile/content_type.dart';
import 'package:myapp/view/screens/profile/profile_info.dart';
import 'package:myapp/view/screens/profile/role.dart';
import 'package:myapp/view/screens/profile/team_size.dart';
import 'package:myapp/view/widgets/custom_back_button.dart';
import 'package:myapp/view/widgets/custom_elevated_button.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
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
            child: Animate(
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomBackButton(
                        onClick: () {
                          if (activeIndex > 0) {
                            pageController.animateToPage(
                              activeIndex - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(4, (index) {
                            return Container(
                              width: getResponsiveWidth(43),
                              height: getResponsiveWidth(5),
                              margin:
                                  EdgeInsets.only(left: getResponsiveWidth(3)),
                              decoration: BoxDecoration(
                                color: activeIndex == index
                                    ? AppColor.primaryColor
                                    : AppColor.primaryColor.withOpacity(.40),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          }),
                        ),
                      )
                    ],
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
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevetedButton(
                      title: activeIndex < formSection.length - 1
                          ? 'Next'
                          : 'Complete',
                      onClick: () {
                        if (activeIndex < formSection.length - 1) {
                          pageController.animateToPage(
                            pageController.page!.toInt() + 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Get.dialog(
                            AlertDialog(
                              title: Text(
                                'You’re All Set! 🎉',
                                style: TextStyle(
                                    fontSize: getResponsiveFontSize(17)),
                              ),
                              icon: const Icon(
                                Icons.check_circle,
                                size: 50,
                                color: AppColor.successColor,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Your profile is ready. Dive into Sonic AI and start creating!.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: getResponsiveFontSize(13),
                                        color: AppColor.descriptionColor),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Get.offAll(() => const HomeScreen()),
                                    child: Text('Go To Home',
                                        style: TextStyle(
                                            fontSize:
                                                getResponsiveFontSize(14))),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
