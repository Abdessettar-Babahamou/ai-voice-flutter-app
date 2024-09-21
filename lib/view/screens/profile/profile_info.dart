import 'package:flutter/material.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

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
          child: Column(children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Image.asset("assets/images/Profile.png"),
                ),
                Positioned(
                  bottom: -5,
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
                      iconSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
