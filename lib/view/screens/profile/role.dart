import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';
import 'package:myapp/utils/responsive_siwe.dart';

class ProfileRole extends StatefulWidget {
  ProfileRole({Key? key}) : super(key: key);

  @override
  State<ProfileRole> createState() => _ProfileRoleState();
}

class _ProfileRoleState extends State<ProfileRole> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getResponsiveHeight(20), horizontal: getResponsiveWidth(5)),
      height: double.infinity,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(4, (index) {
          return RoleCard(
            onClick: () {
              setState(() {
                activeIndex = index;
              });
            }, activeIndex: activeIndex, index: index,
          );
        }),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
    RoleCard({
    super.key,
    required this.onClick,required this.activeIndex,required this.index,
  });
  int activeIndex, index;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
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
              radius: 30,
              child: Image.asset("assets/images/Profile.png"),
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
      ),
    );
  }
}
