import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/voice_controller.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/home/ai_voices.dart';
import 'package:myapp/view/screens/home/widgets/ai_generator.dart';
import 'package:myapp/view/screens/home/widgets/custom_app_bar.dart';
import 'package:myapp/view/screens/home/widgets/popular_voice.dart';
import 'package:myapp/view/widgets/custom_bottom_nav_bar.dart';
import 'package:myapp/view/widgets/home_script_card.dart';
import 'package:myapp/view/widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    Get.put<VoiceController>(VoiceController());
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(kToolbarHeight + getResponsiveWidth(10)),
          child: const CustomHomeAppBar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getResponsiveWidth(20),
                vertical: getResponsiveHeight(15)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const HomeScriptCard(),
                SizedBox(height: getResponsiveHeight(20)),
                const AiGeneratorSection(),
                SizedBox(height: getResponsiveHeight(20)),
                SectionTitle(
                  title: 'Popular voice',
                  onTap: () {
                    Get.to(() => const AiVoices());
                  },
                ),
                SizedBox(height: getResponsiveHeight(16)),
                const PopularVoiceSection(),
                SizedBox(
                  height: getResponsiveWidth(40),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
