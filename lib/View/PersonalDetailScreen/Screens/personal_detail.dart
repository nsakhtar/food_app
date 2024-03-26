import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarship_hub/res/AppColors/app_colors.dart';
import 'package:scholarship_hub/res/CommonWidgets/CustomDropdownMenu/custom_dropdown_menu.dart';
import 'package:scholarship_hub/res/CommonWidgets/CustomTextFormField/custom_text_form_field.dart';
import 'package:scholarship_hub/res/MyTheme/theme_extension.dart';

import '../../../Controllers/PersonalDetailController/personal_detail_controller.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {

  final PersonalDetailController controller = Get.put(PersonalDetailController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Column(
        children: [
          Obx(() => CustomDropdownButtonFormField(
            labelText: 'Present class',
            value: controller.selectedClass.value,
            onChanged: controller.selectClass,
            items: [
              DropdownMenuItem<int>(
                value: 0, // Change the value to null
                child: Text(
                  "Select Present class",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedClass.value == 0
                        ? AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 1,
                child: Text(
                  "Graduation",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedClass.value == 1
                        ? AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 2,
                child: Text(
                  "Post Graduation",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedClass.value == 2
                        ?AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
            ],

            hintText: 'Select Type',
            hintColor: context.customTheme.textColor,
            enabledBorderColor: AppColors.greyColor,
            focusedBorderColor: AppColors.greyColor,
            fillColor: context.customTheme.bgcolor,
            primaryColor: AppColors.primaryColor,
          ),),

          const SizedBox(height: 20),
          Obx(() => CustomDropdownButtonFormField(
            labelText: 'Degree',
            value: controller.selectedDegree.value,
            onChanged: controller.selectDegree,
            items: [
              DropdownMenuItem<int>(
                value: 0, // Change the value to null
                child: Text(
                  "Select Degree",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedDegree.value == 0
                        ? AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 1,
                child: Text(
                  "MBA",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedDegree.value == 1
                        ? AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 2,
                child: Text(
                  "BS Software Engineering",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedDegree.value == 2
                        ?AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
            ],

            hintText: 'Select Type',
            hintColor: context.customTheme.textColor,
            enabledBorderColor: AppColors.greyColor,
            focusedBorderColor: AppColors.greyColor,
            fillColor: context.customTheme.bgcolor,
            primaryColor: AppColors.primaryColor,
          ),),
          const SizedBox(height: 20),
          Obx(() =>CustomTextFormField(
            onTap: () {
              controller.showCustomDatePicker(context);
            },
            readOnly: true,
            labelText: 'Date of Birth',
            hintText: controller.selectedDate.value != null
                ? '${controller.selectedDate.value!.day}-${controller.selectedDate.value!.month}-${controller.selectedDate.value!.year}'
                : 'Select Date of Birth',
            hintTextColor: AppColors.primaryColor,
            suffixIcon: Icons.arrow_drop_down,
            suffixIconColor: AppColors.primaryColor,
          ), ),


          const SizedBox(height: 20),
          Obx(() => CustomDropdownButtonFormField(
            labelText: 'Gender',
            value: controller.selectedGender.value,
            onChanged: controller.selectGender,
            items: [
              DropdownMenuItem<int>(
                value: 0, // Change the value to null
                child: Text(
                  "Select Gender",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedGender.value == 0
                        ? AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 1,
                child: Text(
                  "Male",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedGender.value == 1
                        ? AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 2,
                child: Text(
                  "Female",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedGender.value == 2
                        ?AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 3,
                child: Text(
                  "transgender",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedGender.value == 3
                        ?AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
            ],

            hintText: 'Select Type',
            hintColor: context.customTheme.textColor,
            enabledBorderColor: AppColors.greyColor,
            focusedBorderColor: AppColors.greyColor,
            fillColor: context.customTheme.bgcolor,
            primaryColor: AppColors.primaryColor,
          ),),
          const SizedBox(height: 20),
          Obx(() => CustomDropdownButtonFormField(
            labelText: 'Category',
            value: controller.selectedCategory.value,
            onChanged: controller.selectCategory,
            items: [
              DropdownMenuItem<int>(
                value: 0,
                child: Text(
                  "Select Category",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedCategory.value == 0
                        ? AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 1,
                child: Text(
                  "General",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedCategory.value == 1
                        ? AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 2,
                child: Text(
                  "Category 2",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedCategory.value == 2
                        ?AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 3,
                child: Text(
                  "Category 3",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedCategory.value == 3
                        ?AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
            ],

            hintText: 'Select Type',
            hintColor: context.customTheme.textColor,
            enabledBorderColor: AppColors.greyColor,
            focusedBorderColor: AppColors.greyColor,
            fillColor: context.customTheme.bgcolor,
            primaryColor: AppColors.primaryColor,
          ),),
          const SizedBox(height: 20),
          Obx(() => CustomDropdownButtonFormField(
            labelText: 'State',
            value: controller.selectedCountry.value,
            onChanged: controller.selectCountry,
            items: [
              DropdownMenuItem<int>(
                value: 0, // Change the value to null
                child: Text(
                  "Select State",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedCountry.value == 0
                        ? AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 1,
                child: Text(
                  "Punjab ",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedCountry.value == 1
                        ? AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 2,
                child: Text(
                  "Balochistan",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedCountry.value == 2
                        ?AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 3,
                child: Text(
                  "Khyber Pakhtunkhwa",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedCountry.value == 3
                        ?AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
            ],

            hintText: 'Select Type',
            hintColor: context.customTheme.textColor,
            enabledBorderColor: AppColors.greyColor,
            focusedBorderColor: AppColors.greyColor,
            fillColor: context.customTheme.bgcolor,
            primaryColor: AppColors.primaryColor,
          ),),
          const SizedBox(height: 20),
          Obx(() => CustomDropdownButtonFormField(
            labelText: 'District',
            value: controller.selectedDistrict.value,
            onChanged: controller.selectDistrict,
            items: [
              DropdownMenuItem<int>(
                value: 0, // Change the value to null
                child: Text(
                  "Select District",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedDistrict.value == 0
                        ? AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 1,
                child: Text(
                  "Kasur ",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedDistrict.value == 1
                        ? AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 2,
                child: Text(
                  "Firozpur",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedDistrict.value == 2
                        ?AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 3,
                child: Text(
                  "Jhang ",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedDistrict.value == 3
                        ?AppColors.primaryColor
                        : context.customTheme.textColor,
                  ),
                ),
              ),
            ],

            hintText: 'Select Type',
            hintColor: context.customTheme.textColor,
            enabledBorderColor: AppColors.greyColor,
            focusedBorderColor: AppColors.greyColor,
            fillColor: context.customTheme.bgcolor,
            primaryColor: AppColors.primaryColor,
          ),),
        ],
      ),
    );
  }

}
