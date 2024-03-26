import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:scholarship_hub/res/AppColors/app_colors.dart';

class ProfileController extends GetxController {
  var isPersonalInfoExpanded = false.obs;
  var selectedImage = Rx<File?>(null);

  Future<void> pickImageFromGallery() async {
    final returnedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage != null) {
      selectedImage.value = File(returnedImage.path);
    }
  }

  Future<void> pickImageFromCamera() async {
    final returnedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage != null) {
      selectedImage.value = File(returnedImage.path);
    }
  }

  void showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.all(9),
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Wrap(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  onTap: () {
                    pickImageFromCamera();
                    Navigator.of(context).pop();
                  },
                  leading: const Icon(
                    Icons.camera,
                    color: AppColors.primaryColor,
                  ),
                  title: const Text("Camera"),
                ),
                ListTile(
                  onTap: () {
                    pickImageFromGallery();
                    Navigator.of(context).pop();
                  },
                  leading: const Icon(
                    Icons.image,
                    color: AppColors.primaryColor,
                  ),
                  title: const Text("Gallery"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void togglePersonalInfoExpanded() {
    isPersonalInfoExpanded.value = !isPersonalInfoExpanded.value;
  }
}
