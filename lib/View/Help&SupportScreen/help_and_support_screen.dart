import 'package:flutter/material.dart';

import '../../res/CommonWidgets/AppText/app_text.dart';
import 'package:scholarship_hub/res/MyTheme/theme_extension.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      appBar: AppBar(
        backgroundColor: context.customTheme.bgcolor,
        title: AppText(text: 'Help And Support Screen',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: AppText(text: 'How We can help you?',fontSize: 18,fontWeight: FontWeight.w500,)),
            SizedBox(height: 20,),
            AppText(text: "Guidance on scholarship eligibility criteria.'
               ' Assistance with completing scholarship applications.'
              '  Updates on new scholarship opportunities.'
               ' Tips for writing compelling scholarship essays.'
               ' Information on financial aid resources.'
               ' Tools for tracking application deadlines.'
               ' Support for finding alternative funding options.'
               ' Resources for improving academic and extracurricular profiles.'
               ' Access to personalized scholarship recommendations.'
               ' FAQs and customer support for any queries or concerns.,"
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
