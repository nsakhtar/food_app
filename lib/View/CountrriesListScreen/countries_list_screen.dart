import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scholarship_hub/res/AppColors/app_colors.dart';
import 'package:scholarship_hub/res/MyTheme/theme_extension.dart';

import '../../res/AppAssets/app_assets.dart';
import '../../res/CommonWidgets/AppText/app_text.dart';
import '../../res/routes/route_name.dart';

class CountryList extends StatefulWidget {
  const CountryList({Key? key}) : super(key: key);

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  final List<String> countriesName = [
    'India',
    'Pakistan',
    'Nepal',
    'Australia',
    'Srilanka',
    'Canada',
    'England',
    'New zealand',
    'Afganistan',
    'America'
  ];
  final List<String> countriesFlag = [
    AppAssets.indian,
    AppAssets.pakistan,
    AppAssets.nepal,
    AppAssets.austraila,
    AppAssets.srilanka,
    AppAssets.canada,
    AppAssets.england,
    AppAssets.newzealand,
    AppAssets.afganistan,
    AppAssets.america,
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 300;
    final bool isTablet = size.width > 600;

    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? size.width * 0.025 : 15,
                vertical: isSmallScreen ? size.height * 0.007 : 5,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? size.width * 0.008 : 5),
                    child: SvgPicture.asset(
                      AppAssets.backArrowIcon,
                      color: context.customTheme.iconColor,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(thickness: 2, color: AppColors.darkGreyColor),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AppText(
                text: 'Country Wise Scholarships',
                fontWeight: FontWeight.w500,
                fontSize: isSmallScreen ? 20 : 24,
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: countriesName.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 4 : 2,
                  crossAxisSpacing: isTablet ? 10 : 0,
                  mainAxisSpacing: isTablet ? 10 : 0,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteName.exploreScreen);
                        },
                        child: Container(
                          margin: EdgeInsets.all(isTablet ? 5 : 10),
                          height: isTablet ? 150 : 100,
                          width: isTablet ? 150 : 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: context.customTheme.cardColor,
                            border: Border.all(color: AppColors.greyColor),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              countriesFlag[index],
                              height: isTablet ? 150 : 100, // Adjust height for tablets
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      AppText(
                        text: countriesName[index],
                        textColor: context.customTheme.textColor,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
