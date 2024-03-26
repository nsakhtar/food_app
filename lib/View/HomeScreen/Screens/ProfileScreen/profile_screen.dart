import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarship_hub/View/EducationDetailsScreen/education_details_screen.dart';
import 'package:scholarship_hub/View/MYDocumentScreen/my_document_screen.dart';
import 'package:scholarship_hub/res/MyTheme/theme_extension.dart';
import 'package:scholarship_hub/res/routes/route_name.dart';
import '../../../../Controllers/ProfileScreenController/profile_screen_controller.dart';
import '../../../../res/AppAssets/app_assets.dart';
import '../../../../res/AppColors/app_colors.dart';
import '../../../../res/CommonWidgets/AppText/app_text.dart';
import '../../../../res/CommonWidgets/CustomListTile/CustomListTile.dart';
import '../../../../res/CommonWidgets/CustomTextFormField/custom_text_form_field.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
final  ProfileController profileController= Get.put(ProfileController()); // Profile controller instance


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600;
    final bool isTabletScreen = size.width >= 600 && size.width < 1300;

    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),

            Obx(() => Stack(
              children: [
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.shade100,
                    border: Border.all(width: 2, color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: profileController.selectedImage?.value != null
                        ? Image.file(
                      profileController.selectedImage!.value!,
                      fit: BoxFit.fill,
                    )
                        : Image.asset(
                      AppAssets.profile,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 95,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () => profileController.showPicker(context),
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            )),

            const SizedBox(
              height: 15,
            ),
            AppText(
              text: 'Aditi Sharma',
              fontSize: isTabletScreen?35:20,
              fontWeight: FontWeight.w600,
            ),
            AppText(
              text: 'Post Graduation',
              fontSize: isTabletScreen?25:12,
              textColor: AppColors.greyColor,
            ),
            const SizedBox(height: 10),
            Obx(() => Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [

                  CustomListTile(
                    leadingColor: Colors.blue,
                    leadingBgColor: Colors.blue.withOpacity(.3),
                    leading: AppAssets.personIcon,
                    title: 'Personal Information',
                    trailing: profileController.isPersonalInfoExpanded.value
                        ? Icons.keyboard_arrow_down_outlined
                        : Icons.arrow_forward_ios_outlined,
                    onTap: profileController.togglePersonalInfoExpanded,
                  ),
                  if (profileController.isPersonalInfoExpanded.value) ...[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? size.width * 0.05 : 30,
                        vertical: isSmallScreen ? size.height * 0.02 : 20,
                      ),
                      child: Column(
                        children: [
                          const CustomTextFormField(
                            labelText: 'First name',
                            hintText: 'Aditi',
                            prefixIcon: Icons.person_2_outlined,
                          ),
                          SizedBox(
                            height: isSmallScreen ? size.height * 0.02 : 20,
                          ),
                          const CustomTextFormField(
                            labelText: 'Last name',
                            hintText: 'Sharma',
                            prefixIcon: Icons.person_2_outlined,
                          ),
                          SizedBox(
                            height: isSmallScreen ? size.height * 0.02 : 20,
                          ),
                          const CustomTextFormField(
                            labelText: 'Mobile number',
                            hintText: '+923431451403',
                            prefixIcon: Icons.phone_outlined,
                          ),
                          SizedBox(
                            height: isSmallScreen ? size.height * 0.02 : 20,
                          ),
                          const CustomTextFormField(
                            labelText: 'Date of Birth',
                            hintText: '12-12-1999',
                            prefixIcon: Icons.calendar_month_outlined,
                          ),
                          SizedBox(
                            height: isSmallScreen ? size.height * 0.02 : 20,
                          ),
                          const CustomTextFormField(
                            labelText: 'Gender',
                            hintText: 'female',
                            prefixIcon: Icons.female,
                          ),
                          SizedBox(
                            height: isSmallScreen ? size.height * 0.02 : 20,
                          ),
                          const CustomTextFormField(
                            labelText: 'Email ID',
                            hintText: 'Aditisharma18@gmail.com',
                            prefixIcon: Icons.email_outlined,
                          ),
                        ],
                      ),
                    ),
                  ],
                  CustomListTile(
                    onTap: (){
                      Get.to(()=>EducationDetailsScreen());
                    },
                    leadingBgColor: Colors.teal.withOpacity(.3),
                    leadingColor: Colors.teal,
                    leading: AppAssets.educationIcon,
                    title: 'Education Details',
                    trailing: Icons.arrow_forward_ios_outlined,
                  ),
                  CustomListTile(
                    onTap: (){
                      Get.toNamed(RouteName.myDocumentScreen);
                    },
                    leadingColor: Colors.blue,
                    leadingBgColor: Colors.blue.withOpacity(.3),
                    leading: AppAssets.filesIcon,
                    title: 'My Documents',
                    trailing: Icons.arrow_forward_ios_outlined,
                  ),
                  CustomListTile(
                    leadingColor: Colors.grey,
                    leadingBgColor: Colors.grey.withOpacity(.3),
                    leading: AppAssets.appliedIcon,
                    title: 'Applied Scholarship',
                    trailing: Icons.arrow_forward_ios_outlined,
                  ),
                  CustomListTile(
                    onTap: (){
                      Get.toNamed(RouteName.sendFeedbackScreen);
                    },
                    leadingColor: Colors.orangeAccent,
                    leadingBgColor: Colors.orangeAccent.withOpacity(.3),
                    leading: AppAssets.feedbackIcon,
                    title: 'Send Feedback',
                    trailing: Icons.arrow_forward_ios_outlined,
                  ),
                  CustomListTile(
                    onTap: (){
                      Get.toNamed(RouteName.privacyPolicyScreen);
                    },
                    leadingColor: Colors.green,
                    leadingBgColor: Colors.green.withOpacity(.3),
                    leading: AppAssets.privacyIcon,
                    title: 'Privacy Policy',
                    trailing: Icons.arrow_forward_ios_outlined,
                  ),
                  CustomListTile(
                    onTap: (){
                      Get.toNamed(RouteName.helpAndSupportScreen);
                    },
                    leadingColor: Colors.redAccent.withOpacity(.7),
                    leadingBgColor: Colors.redAccent.withOpacity(.3),
                    leading: AppAssets.helpIcon,
                    title: 'Help & Support',
                    trailing: Icons.arrow_forward_ios_outlined,
                  ),

                ],
              ),
            ),),

          ],
        ),
      ),
    );
  }
}
