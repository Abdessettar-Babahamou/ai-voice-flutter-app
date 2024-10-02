import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/home/widgets/popular_voice.dart';
import 'package:myapp/view/widgets/custom_app_bar.dart';

class AiVoices extends StatelessWidget {
  const AiVoices({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(
            title: 'Explore AI Voices',
            actionIconExist: true,
            actionIcon: Icons.filter_list,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getResponsiveWidth(10),
                vertical: getResponsiveHeight(15)),
            child: Column(
              children: [
                _buildSearchContainer(context),
                SizedBox(height: getResponsiveHeight(20)),
                const PopularVoiceSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildSearchContainer(BuildContext context) {
  SizeResponsive.init(context);
  return Container(
    decoration: BoxDecoration(
      color: AppColor.btnInputColor,
      borderRadius: BorderRadius.circular(20),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: getResponsiveWidth(10),
      vertical: getResponsiveWidth(10),
    ),
    child: TextFormField(
      style: TextStyle(
        color: Colors.white,
        fontSize: getResponsiveFontSize(14),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(5)),
        hintText: 'Search AI voices...',
        prefixIcon: const Icon(
          Icons.search,
          size: 30,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (value) {},
    ),
  );
}
