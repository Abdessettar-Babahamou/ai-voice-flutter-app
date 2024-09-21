import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/theme.dart';
import 'package:myapp/view/screens/auth/get_started.dart';
import 'package:myapp/view/screens/auth/sign_in.dart';
import 'package:myapp/view/screens/auth/sign_up.dart';
import 'package:myapp/view/screens/profile/complete_profile.dart';
import 'package:myapp/view/widgets/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      darkTheme: darkTheme,
      home:  CompleteProfileScreen(),
    );
  }
}
