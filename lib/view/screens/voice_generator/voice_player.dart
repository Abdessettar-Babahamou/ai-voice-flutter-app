import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/controller/player_controller.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/voice_generator/widgets/video_player_card.dart';
import 'package:myapp/view/widgets/custom_app_bar.dart';
import 'package:myapp/view/widgets/custom_elevated_button.dart';

class VoicePlayer extends GetView<PlayerController> {
  const VoicePlayer({super.key});

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getResponsiveWidth(50)),
        child: const CustomAppBar(
          title: 'Voice Player',
          titleIsExist: true,
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: getResponsiveHeight(20),
                  horizontal: getResponsiveWidth(20)),
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VideoPlayerCard(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            getResponsiveWidth(40),
                        child: CustomElevetedButton(
                          title: 'Share',
                          buttonColor: AppColor.btnInputColor,
                          onClick: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            getResponsiveWidth(40),
                        child: CustomElevetedButton(
                          title: 'Download',
                          onClick: () async {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
