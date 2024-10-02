import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/auth/sign_in.dart';
import 'package:myapp/view/widgets/custom_app_bar.dart';
import 'package:myapp/view/widgets/custom_elevated_button.dart';
import 'package:myapp/view/widgets/custom_text_filed.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                      children: [
                        Text(
                          'Create Your Account 🔐',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: getResponsiveFontSize(22),
                              fontWeight: FontWeight.bold),
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 300)),
                        const SizedBox(height: 8),
                        Text(
                          "Join now and unlock 1000+ voice effects instantly",
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
                        CustomTextFiled(
                          hintText: 'Password',
                          obscureText: true,
                          controller: TextEditingController(),
                          suffixIcon: Icons.remove_red_eye,
                          prefixIcon: Icons.lock,
                        ).animate().fade(
                            duration: const Duration(milliseconds: 300),
                            delay: const Duration(milliseconds: 300)),
                        CustomTextFiled(
                          hintText: 'Confirm Password',
                          obscureText: true,
                          controller: TextEditingController(),
                          suffixIcon: Icons.remove_red_eye,
                          prefixIcon: Icons.lock,
                        ).animate().fade(
                            duration: const Duration(milliseconds: 300),
                            delay: const Duration(milliseconds: 300)),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: CustomElevetedButton(
                            title: 'Sign Up',
                            onClick: () {},
                          ),
                        ).animate().fade(
                            duration: const Duration(milliseconds: 300),
                            delay: const Duration(milliseconds: 300)),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already Have an Account ? ",
                                style: TextStyle(
                                    fontSize: getResponsiveFontSize(12))),
                            TextButton(
                              onPressed: () {
                                Get.to(() => const SignInScreen());
                              },
                              child: Text(
                                'Sign in',
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
