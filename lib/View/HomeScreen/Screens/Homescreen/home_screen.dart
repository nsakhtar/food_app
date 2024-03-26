import 'package:banner_carousel/banner_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scholarship_hub/Controllers/HomeScreenController/home_screen_controller.dart';
import 'package:scholarship_hub/View/HomeScreen/Screens/Homescreen/Widgets/AcrossCountryCard/across_country_card.dart';
import 'package:scholarship_hub/res/MyTheme/theme_extension.dart';
import '../../../../res/AppAssets/app_assets.dart';
import '../../../../res/AppColors/app_colors.dart';
import '../../../../res/CommonWidgets/AppText/app_text.dart';
import '../../../../res/CommonWidgets/CustomTextFormField/custom_text_form_field.dart';
import '../../../../res/routes/route_name.dart';
import 'Widgets/CustomBanner/custom_banner.dart';
import 'Widgets/CustomCard/custom_card.dart';
import 'Widgets/Drawer/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  final AdvancedDrawerController _controller = AdvancedDrawerController();
  bool isDrawerOpen = false;

// Inside your Scaffold widget, set a GlobalKey for the Drawer
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600;
    final bool isTabletScreen = size.width >= 600 && size.width < 1281;
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: context.customTheme.bgcolor,
        ),
      ),
      controller: _controller,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: MyDrawer(),
      child: Scaffold(
        backgroundColor: context.customTheme.bgcolor,
        key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: isDrawerOpen ? Icon(Icons.close) : Icon(Icons.menu),
            onPressed: () {
              if (isDrawerOpen) {
                _controller.hideDrawer();
                setState(() {
                  isDrawerOpen = false;
                });
              } else {
                _controller.showDrawer();
                setState(() {
                  isDrawerOpen = true;
                });
              }
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(RouteName.notificationScreen);
              },
              icon: Icon(
                Icons.notifications_outlined,
                color: context.customTheme.iconColor,
                size: isTabletScreen ? 40 : 22,
              ),
            ),
          ],
          backgroundColor: context.customTheme.bgcolor,
          title: AppText(
            text: 'Scholar Hub',
            fontSize: isTabletScreen ? 30 : 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CustomTextFormField(
                borderColor: Colors.transparent,
                contentPadding: const EdgeInsets.all(1),
                hintTextFontSize: 16,
                filled: true,
                fillColor: AppColors.greyColor.withOpacity(.30),
                line1Color: Colors.transparent,
                prefixIcon: Icons.search,
                hintText: 'Search',
                suffixIcon: Icons.mic,
                line2Color: AppColors.darkGreyColor,
              ),
            ),
            const SizedBox(height: 20),
            const BannerCarousel(
              activeColor: AppColors.primaryColor,
              customizedBanners: [
                CustomBanner(
                  imagePath: AppAssets.banner1,
                ),
                CustomBanner(
                  imagePath: AppAssets.banner1,
                ),
                CustomBanner(
                  imagePath: AppAssets.banner1,
                ),
                CustomBanner(
                  imagePath: AppAssets.banner1,
                ),
                CustomBanner(
                  imagePath: AppAssets.banner1,
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.greyColor.withOpacity(.3),
              ),
              height: isTabletScreen
                  ? 80
                  : isSmallScreen
                  ? 40
                  : 35,
              width: isTabletScreen
                  ? 50
                  : isSmallScreen
                  ? 40
                  : 35,
              child: SvgPicture.asset(
                    AppAssets.appliedIcon,
                    color: context.customTheme.iconColor,
                  ),
              ),
                  SizedBox(
                    width: 10,
                  ),
                  AppText(
                    text: 'Trending Scholarships',
                    fontWeight: FontWeight.w600,
                    fontSize: isTabletScreen ? 25 : 15,
                  ),
                  Spacer(),
                  AppText(
                    text: 'view all',
                    fontWeight: FontWeight.w500,
                    fontSize: isTabletScreen ? 20 : 12,
                    textColor: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 252,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: CustomCard(),
                      );
                    }),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.greyColor.withOpacity(.3),
              ),
              height: isTabletScreen
                  ? 80
                  : isSmallScreen
                  ? 40
                  : 35,
              width: isTabletScreen
                  ? 50
                  : isSmallScreen
                  ? 40
                  : 35,
              child:  SvgPicture.asset(
                    AppAssets.appliedIcon,
                    color: context.customTheme.iconColor,
                  ),
              ),
                  SizedBox(
                    width: 10,
                  ),
                  AppText(
                    text: 'Featured Scholarships',
                    fontWeight: FontWeight.w600,
                    fontSize: isTabletScreen ? 25 : 15,
                  ),
                  Spacer(),
                  AppText(
                    text: 'view all',
                    fontWeight: FontWeight.w500,
                    fontSize: isTabletScreen ? 20 : 12,
                    textColor: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: isTabletScreen ? size.height * .15 : 84,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: size.height * .15,
                          child: Image.asset(
                            AppAssets.feature,
                            height: isTabletScreen ? size.height * .15 : 84,
                            fit: BoxFit.fill,
                          ),
                        )),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppText(
                            text: 'Saksham Scholarship 2023 ',
                            fontSize: isTabletScreen ? 20 : 12,
                            fontWeight: FontWeight.w400,
                          ),
                          AppText(
                            text: 'Award: Up to INR 20,000/-',
                            fontSize: isTabletScreen ? 20 : 12,
                            fontWeight: FontWeight.w400,
                          ),
                          AppText(
                            text: 'Eligibility: First Year UG St ...',
                            fontSize: isTabletScreen ? 20 : 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            CarouselSlider(
              items: [
                // Add your banner items here
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20, vertical: isTabletScreen ? 100 : 30),
                  child: Image.asset(
                    AppAssets.banner1,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20, vertical: isTabletScreen ? 100 : 30),
                  child: Image.asset(
                    AppAssets.banner1,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20, vertical: isTabletScreen ? 100 : 30),
                  child: Image.asset(
                    AppAssets.banner1,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
              options: CarouselOptions(
                  autoPlay: true, // Enable auto scrolling
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.greyColor.withOpacity(.3),
                    ),
                    height: isTabletScreen
                        ? 80
                        : isSmallScreen
                            ? 40
                            : 35,
                    width: isTabletScreen
                        ? 50
                        : isSmallScreen
                            ? 40
                            : 35,
                    child: Image.asset(
                      AppAssets.countryIcon,
                      color: context.customTheme.iconColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  AppText(
                    text: 'Across Country',
                    fontWeight: FontWeight.w600,
                    fontSize: isTabletScreen ? 25 : 15,
                  ),
                  Spacer(),
                  AppText(
                    text: 'view all',
                    fontWeight: FontWeight.w500,
                    fontSize: isTabletScreen ? 20 : 12,
                    textColor: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 252,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: AcrossCountryCard(),
                      );
                    }),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
