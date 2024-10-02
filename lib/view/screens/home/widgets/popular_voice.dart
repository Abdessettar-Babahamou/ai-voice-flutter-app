import 'package:flutter/material.dart';
import 'package:myapp/constants/constants.dart';
import 'package:myapp/view/widgets/voice_card.dart';

class PopularVoiceSection extends StatefulWidget {
  const PopularVoiceSection({
    super.key,
  });

  @override
  State<PopularVoiceSection> createState() => _PopularVoiceSectionState();
}

class _PopularVoiceSectionState extends State<PopularVoiceSection> {
  int selectedIndex = -1;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(voiceItem.length, (index) {
        return VoiceCard(
          isSelected: index == selectedIndex,
          onTap: () {
            setState(() {
              selectedIndex = selectedIndex == index ? -1 : index;
            });
          },
          image: voiceItem[index]['image'],
          title: voiceItem[index]['title'],
          description: voiceItem[index]['description'],
          duration: voiceItem[index]['duration'],
          imageBgColor: voiceItem[index]['color'],
        );
      }),
    );
  }
}
