import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/auth/sign_up.dart';
import 'package:myapp/view/screens/profile/complete_profile.dart';
import 'package:myapp/view/widgets/custom_app_bar.dart';
import 'package:myapp/view/widgets/custom_elevated_button.dart';
import 'package:myapp/view/widgets/custom_text_filed.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + getResponsiveWidth(20)),
        child: const CustomAppBar(title: ''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getResponsiveWidth(16)),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Center(
                child: SizedBox(
                  width: constraints.maxWidth > 1000 ? 1000 : double.infinity,
                  child: Animate(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome Back! 👋',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: getResponsiveFontSize(22),
                              fontWeight: FontWeight.bold),
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 300)),
                        const SizedBox(height: 8),
                        Text(
                          "Great to see you again, You've been missed!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: getResponsiveFontSize(15),
                              color: AppColor.descriptionColor),
                        ).animate().fade(
                            duration: const Duration(milliseconds: 300),
                            delay: const Duration(milliseconds: 300)),
                        const SizedBox(height: 24),
                        CustomTextFiled(
                          hintText: 'Email',
                          obscureText: false,
                          controller: TextEditingController(),
                          prefixIcon: Icons.email,
                        ).animate().fade(
                            duration: const Duration(milliseconds: 300),
                            delay: const Duration(milliseconds: 300)),
                        const SizedBox(height: 10),
                        CustomTextFiled(
                          hintText: 'Password',
                          obscureText: true,
                          controller: TextEditingController(),
                          suffixIcon: Icons.remove_red_eye,
                          prefixIcon: Icons.lock,
                        ).animate().fade(
                            duration: const Duration(milliseconds: 300),
                            delay: const Duration(milliseconds: 300)),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontSize: getResponsiveFontSize(12)),
                            ).animate().slideX(
                                duration: const Duration(milliseconds: 300),
                                delay: const Duration(milliseconds: 300),
                                begin: 50,
                                end: 0),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          child: CustomElevetedButton(
                            title: 'Sign In',
                            onClick: () {
                              Get.to(() => const CompleteProfileScreen());
                            },
                          ),
                        ).animate().fade(
                            duration: const Duration(milliseconds: 300),
                            delay: const Duration(milliseconds: 300)),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  fontSize: getResponsiveFontSize(12)),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(() => const SignUpScreen());
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: getResponsiveFontSize(13)),
                              ),
                            ),
                          ],
                        ).animate().fade(
                            duration: const Duration(milliseconds: 300),
                            delay: const Duration(milliseconds: 300)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
