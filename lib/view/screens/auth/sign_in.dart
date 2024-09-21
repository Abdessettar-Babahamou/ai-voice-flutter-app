import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/widgets/custom_text_filed.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all<Color>(AppColor.btnInputColor),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          icon: const Icon(Icons.arrow_left_sharp),
          onPressed: () => {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome Back! 👋',
                style: TextStyle(
                    fontSize: getResponsiveFontSize(22),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Great to see you again, You've been missed!",
                style: TextStyle(
                    fontSize: getResponsiveFontSize(15),
                    color: AppColor.descriptionColor),
              ),
              const SizedBox(height: 24),
              CustomTextFiled(
                hintText: 'Email',
                obscureText: false,
                controller: TextEditingController(),
                prefixIcon: Icons.email,
              ),
              const SizedBox(height: 10),
              CustomTextFiled(
                hintText: 'Password',
                obscureText: true,
                controller: TextEditingController(),
                suffixIcon: Icons.remove_red_eye,
                prefixIcon: Icons.lock,
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(AppColor.primaryColor),
                  ),
                  onPressed: () {},
                  child:   Text('Sign In',style: TextStyle(fontSize: getResponsiveFontSize(15),color: Colors.white),),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
