import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scholarship_hub/res/MyTheme/theme_extension.dart';
import '../AppText/app_text.dart';

class CustomListTile extends StatelessWidget {
  final String leading,title;
  final Color? titleColor,leadingColor,leadingBgColor;
  final IconData? trailing;
  final Widget? childWidget;
  final double? horizontalTitleGap;
  final void Function()? onTap;
  const CustomListTile(
      {super.key,
      required this.leading,
      required this.title,
      this.childWidget, this.trailing, this.titleColor, this.leadingColor, this.onTap, this.leadingBgColor, this.horizontalTitleGap});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600;
    final bool isTabletScreen = size.width >= 600 && size.width < 1300;
    return ListTile(
      onTap:onTap ,
      horizontalTitleGap:isTabletScreen?30: 12,
      leading: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: leadingBgColor??Colors.transparent,
        ),
          height: isTabletScreen?80:isSmallScreen?40:35,
          width: isTabletScreen?50:isSmallScreen?40:35,
          child: SvgPicture.asset(leading,color: leadingColor??context.customTheme.iconColor,)),
      title: AppText(
        text: title,
        textColor: titleColor,
        fontSize:  isTabletScreen?30:isSmallScreen?15:12,
        fontWeight: FontWeight.w500,
      ),
      trailing: childWidget ??
          Icon(
           trailing,
            color: context.customTheme.iconColor,
            size: isTabletScreen?30:isSmallScreen?18:12,
          ),
    );
  }
}
