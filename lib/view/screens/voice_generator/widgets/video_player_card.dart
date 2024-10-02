import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/controller/player_controller.dart';
import 'package:myapp/utils/helpers.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/widgets/custom_elevated_button.dart';

class VideoPlayerCard extends GetView<PlayerController> {
  const VideoPlayerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(getResponsiveWidth(10)),
          decoration: BoxDecoration(
            color: AppColor.btnInputColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                width: getResponsiveWidth(60),
                height: getResponsiveWidth(60),
                padding: EdgeInsets.all(getResponsiveWidth(10)),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  "assets/images/voice-1.png",
                  width: getResponsiveWidth(40),
                  height: getResponsiveWidth(40),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: getResponsiveWidth(10)),
              Expanded(
                child: Text(
                  "Nathan - ${controller.mapLanguages[controller.selectedLanguage]}",
                  style: TextStyle(fontSize: getResponsiveFontSize(15)),
                ),
              ),
              SizedBox(width: getResponsiveWidth(10)),
              SizedBox(
                width: getResponsiveWidth(100),
                child: CustomElevetedButton(
                  title: "Change",
                  fontSize: 13,
                  onClick: () {},
                ),
              )
            ],
          ),
        ),
        SizedBox(height: getResponsiveHeight(20)),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColor.btnInputColor,
            border: Border.all(
                color: AppColor.primaryColor,
                width: 1), // Border color and width
            borderRadius: BorderRadius.circular(12),
            // Border radius
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12), // Match border radius
            child: Image.asset(
              'assets/images/image1.png',
              fit: BoxFit.cover,
            ), // Update with your image path
          ),
        ),
        // Slider
        SizedBox(height: getResponsiveHeight(10)),
        GetBuilder<PlayerController>(
            id: 'slider-state',
            builder: (context) {
              return SliderTheme(
                data: const SliderThemeData(),
                child: SizedBox(
                  width: double.infinity,
                  child: Slider(
                    value: controller.activeVoiceTime <=
                            controller.finalRecordTime
                        ? double.parse(controller.activeVoiceTime.toString())
                        : double.parse(controller.finalRecordTime.toString()),
                    max: double.parse(controller.finalRecordTime.toString()),
                    onChanged: (value) {},
                  ),
                ),
              );
            }),

        GetBuilder<PlayerController>(
          id: 'player-id',
          builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timeFormate(controller.finalRecordTime),
                  style: TextStyle(
                      fontSize: getResponsiveFontSize(14), color: Colors.white),
                ),
                Text(
                  timeFormate(controller.activeVoiceTime),
                  style: TextStyle(
                      fontSize: getResponsiveFontSize(14), color: Colors.white),
                ),
              ],
            );
          },
        ),
        SizedBox(height: getResponsiveHeight(10)),
        // Custom circular button
        Container(
          width: getResponsiveWidth(60),
          height: getResponsiveWidth(60),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                const Color(0xFFB3ABFF).withOpacity(.6),
                const Color(0xFF8681D6).withOpacity(.6),
              ],
              stops: const [1, 0],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF807ACC),
                offset: Offset(0, -3.18),
                blurRadius: 3.18,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0xFF807ACC),
                offset: Offset(0, 3.18),
                blurRadius: 3.18,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0xFF201F33),
                offset: Offset(0, 10.22),
                blurRadius: 20.44,
                spreadRadius: 0,
              ),
            ],
          ),
          child: IconButton(
            icon: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Color(0xFFB0A8FF),
                  Color(0xFF847EC5),
                ],
                stops: [0.1, 0.1],
              ).createShader(bounds),
              child: GetBuilder<PlayerController>(
                  id: 'btn-play',
                  builder: (context) {
                    return Icon(
                      controller.isPlaying ? Icons.pause : Icons.play_arrow,
                      // color: AppColor.primaryColor,
                      size: getResponsiveWidth(40),
                    );
                  }),
            ),
            onPressed: () async {
              controller.playAudio();
            },
          ),
        ),
        SizedBox(height: getResponsiveHeight(30)),
      ],
    );
  }
}
