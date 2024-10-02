import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/controller/voice_controller.dart';
import 'package:myapp/utils/helpers.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/voice_generator/widgets/wave_item.dart';

class RecordCircle extends StatelessWidget {
  const RecordCircle({super.key});

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return Center(
      child: GetX<VoiceController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.all(getResponsiveWidth(10)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (controller.isListening.value) ...[
                  WaveItem(
                    color: AppColor.primaryColor.withOpacity(.50),
                    rotation: controller.rotation.value,
                    scale: controller.scale.value,
                  ),
                  WaveItem(
                    color: AppColor.primaryColor.withOpacity(.50),
                    rotation: controller.rotation.value + 0.25 * pi,
                    scale: controller.scale.value,
                  ),
                  WaveItem(
                    color: AppColor.primaryColor.withOpacity(.50),
                    rotation: controller.rotation.value + (-0.25 * pi),
                    scale: controller.scale.value,
                  ),
                  WaveItem(
                    color: AppColor.primaryColor.withOpacity(.50),
                    rotation: controller.rotation.value + 0.5 * pi,
                    scale: controller.scale.value,
                  ),
                ],
                Container(
                  width: 180,
                  height: 180,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.btnInputColor,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFA099FF),
                        blurRadius: 27,
                        spreadRadius: 5,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      timeFormate(controller.time),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
