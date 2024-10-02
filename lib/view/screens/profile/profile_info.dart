import 'package:flutter/material.dart';
import 'package:myapp/constants/constants.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/profile/widgets/title_and_description.dart';
import 'package:myapp/view/widgets/custom_text_filed.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: getResponsiveWidth(20),
            horizontal: getResponsiveWidth(5)),
        child: Form(
          child: Column(
            children: [
              TitleAndDescription(
                title: sectionTitle[2]['title'],
                description: sectionTitle[2]['description'],
              ),
              SizedBox(height: getResponsiveHeight(20)),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: getResponsiveWidth(30),
                    child: Image.asset("assets/images/Profile.png"),
                  ),
                  Positioned(
                    bottom: -10,
                    right: 0,
                    child: Container(
                      width: getResponsiveWidth(32),
                      height: getResponsiveWidth(32),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(Icons.add_a_photo),
                        color: Colors.blue,
                        iconSize: getResponsiveWidth(16),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getResponsiveWidth(20)),
              CustomTextFiled(
                  hintText: 'User Name',
                  obscureText: false,
                  controller: TextEditingController(),
                  prefixIcon: Icons.person),
              SizedBox(height: getResponsiveWidth(5)),
              CustomTextFiled(
                  hintText: 'Phone Number',
                  obscureText: false,
                  controller: TextEditingController(),
                  prefixIcon: Icons.person),
            ],
          ),
        ),
      ),
    );
  }
}
