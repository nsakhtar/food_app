import 'package:flutter/material.dart';

import '../../res/CommonWidgets/AppText/app_text.dart';
import 'package:scholarship_hub/res/MyTheme/theme_extension.dart';
class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      appBar: AppBar(
      backgroundColor: context.customTheme.bgcolor,
        title: AppText(text: 'Privacy Policy Screen',),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text: 'Terms',fontSize: 18,fontWeight: FontWeight.w500,),
            SizedBox(height: 20,),
            AppText(text: "By using our scholarship app, you agree to adhere to "
                "the provided guidelines and conditions for eligibility and application.",
            ),
            SizedBox(height: 20,),
            AppText(text: 'Privacy Policy',fontSize: 18,fontWeight: FontWeight.w500,),
            SizedBox(height: 20,),
            AppText(text: "Your data is securely collected for scholarship "
                "processing only. We respect your privacy and don't share information"
                " with third parties.",
            ),
          ],
        ),
      ),
    );
  }
}
