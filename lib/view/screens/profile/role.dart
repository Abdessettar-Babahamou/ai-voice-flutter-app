import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/constants/constants.dart';
import 'package:myapp/utils/responsive_siwe.dart';
import 'package:myapp/view/screens/profile/widgets/title_and_description.dart';

class ProfileRole extends StatefulWidget {
  const ProfileRole({super.key});

  @override
  State<ProfileRole> createState() => _ProfileRoleState();
}

class _ProfileRoleState extends State<ProfileRole> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeResponsive.init(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleAndDescription(
            title: sectionTitle[0]['title'],
            description: sectionTitle[0]['description'],
          ),
          SizedBox(height: getResponsiveHeight(20)),
          Wrap(
            children: List.generate(4, (index) {
              return RoleCard(
                onClick: () {
                  setState(() {
                    activeIndex = index;
                  });
                },
                activeIndex: activeIndex,
                index: index,
              );
            }),
          )
        ],
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  const RoleCard({
    super.key,
    required this.onClick,
    required this.activeIndex,
    required this.index,
  });
  final int activeIndex, index;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - getResponsiveWidth(35),
        margin: const EdgeInsets.all(5),
        padding: EdgeInsets.all(getResponsiveWidth(10)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.btnInputColor,
          borderRadius: BorderRadius.circular(10),
          border: activeIndex == index
              ? Border.all(color: AppColor.primaryColor, width: 2)
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 30,
              child: Image.asset(
                "assets/images/Profile.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: getResponsiveHeight(10),
            ),
            Text(
              "Frelencer",
              style: TextStyle(fontSize: getResponsiveFontSize(15)),
            )
          ],
        ),
      ).animate().fade(
          duration: const Duration(milliseconds: 300),
          delay: Duration(milliseconds: 300 * index)),
    );
  }
}
