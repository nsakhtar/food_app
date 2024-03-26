import 'package:flutter/material.dart';

import '../../../../res/AppAssets/app_assets.dart';
import '../../../../res/AppColors/app_colors.dart';
import '../../../../res/CommonWidgets/AppText/app_text.dart';

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600;
    final bool isTabletScreen = size.width >= 600 && size.width < 1300;

    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 10 : 20),
          child: ListTile(
            leading: Image.asset(
              AppAssets.card,
              width: isTabletScreen ? 300 : 100,
              height: isTabletScreen ? 300 : 100,
              fit: BoxFit.fill,
            ),
            title: AppText(
              text: 'Your Documents are verified for Medhaavi Engineerin ...',
              fontSize: isTabletScreen ? 16 : 12, // Adjust the font size based on screen size
            ),
            subtitle: AppText(
              text: '9 hour ago',
              fontSize: isTabletScreen ? 14 : 10, // Adjust the font size based on screen size
              textColor: AppColors.greyColor,
            ),
            trailing: Icon(
              Icons.more_vert,
              color: AppColors.greyColor,
              size: isTabletScreen ? 30 : 24, // Adjust the icon size based on screen size
            ),
          ),
        );
      },
    );
  }
}
