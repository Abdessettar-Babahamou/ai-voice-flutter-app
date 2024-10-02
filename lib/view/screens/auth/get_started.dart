import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/auth/sign_in.dart';
import 'package:myapp/view/widgets/custom_elevated_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getResponsiveWidth(20),
                  vertical: getResponsiveHeight(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Let’s Get Started!',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: getResponsiveFontSize(20)),
                  ),
                  SizedBox(height: getResponsiveHeight(10)),
                  Text(
                    'Discover the latest 1000+ Voice Effects!',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: getResponsiveFontSize(14),
                        color: AppColor.descriptionColor),
                  ),
                  SizedBox(height: getResponsiveWidth(20)),
                  CustomElevetedButton(
                    title: 'Continue with Email',
                    buttonColor: AppColor.btnInputColor,
                    onClick: () => Get.to(() => const SignInScreen()),
                    iconExist: true,
                    icon: 'assets/images/email.svg',
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColor.descriptionColor.withOpacity(.5),
                          thickness: 1,
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Text("or"),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColor.descriptionColor.withOpacity(.5),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  CustomElevetedButton(
                    title: 'Continue with Google',
                    buttonColor: AppColor.btnInputColor,
                    onClick: () {},
                    iconExist: true,
                    icon: 'assets/images/google.svg',
                  ),
                  SizedBox(height: getResponsiveWidth(10)),
                  CustomElevetedButton(
                    title: 'Continue with Apple',
                    buttonColor: AppColor.btnInputColor,
                    onClick: () {},
                    iconExist: true,
                    icon: 'assets/images/apple.svg',
                  ),
                  SizedBox(height: getResponsiveWidth(10)),
                  CustomElevetedButton(
                    title: 'Continue with Facebook',
                    buttonColor: AppColor.btnInputColor,
                    onClick: () {},
                    iconExist: true,
                    icon: 'assets/images/facebook.svg',
                  ),
                  SizedBox(height: getResponsiveWidth(10)),
                  CustomElevetedButton(
                    title: 'Continue with Twitter',
                    buttonColor: AppColor.btnInputColor,
                    onClick: () {},
                    iconExist: true,
                    icon: 'assets/images/twitter.svg',
                  ),
                  SizedBox(height: getResponsiveWidth(20)),
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: getResponsiveFontSize(14),
                          color: AppColor.descriptionColor),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Sign In',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: getResponsiveFontSize(14),
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => const SignInScreen());
                              }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
