import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/widgets/custom_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getResponsiveWidth(20),
                vertical: getResponsiveHeight(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                // SizedBox(height: getResponsiveHeight(10)),
                CustomButton(
                  text: 'Continue with Email',
                  onPressed: () => {},
                  iconExist: true,
                  backgroundColor: AppColor.btnGryColor,
                  borderColor: AppColor.btnGryColor,
                  icon: Icons.email,
                  iconColor: Colors.white,
                ),
                SizedBox(height: getResponsiveWidth(5)),
                CustomButton(
                  text: 'Continue with Google',
                  onPressed: () => {},
                  iconExist: true,
                  backgroundColor: AppColor.btnGryColor,
                  borderColor: AppColor.btnGryColor,
                  icon: Icons.facebook,
                  iconColor: Colors.white,
                ),
                SizedBox(height: getResponsiveWidth(5)),
                CustomButton(
                  text: 'Continue with Facebook',
                  onPressed: () => {},
                  iconExist: true,
                  backgroundColor: AppColor.btnGryColor,
                  borderColor: AppColor.btnGryColor,
                  icon: Icons.email,
                  iconColor: Colors.white,
                ),
                SizedBox(height: getResponsiveWidth(10)),
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
                              // Navigate to the desired screen
                            }),
                    ],
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
