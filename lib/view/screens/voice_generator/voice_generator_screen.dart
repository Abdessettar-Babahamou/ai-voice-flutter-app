import 'package:flutter/material.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/voice_generator/widgets/custom_bottom_bar_generator.dart';
import 'package:myapp/view/screens/voice_generator/widgets/record_circle.dart';
import 'package:myapp/view/widgets/custom_app_bar.dart';

class VoiceGeneratorScreen extends StatelessWidget {
  const VoiceGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getResponsiveWidth(50)),
        child: const CustomAppBar(
          title: 'AI Voice Generator',
          titleIsExist: true,
        ),
      ),
      body: const RecordCircle(),
      bottomNavigationBar: CustomVoiceBottomBar(),
    );
  }
}
