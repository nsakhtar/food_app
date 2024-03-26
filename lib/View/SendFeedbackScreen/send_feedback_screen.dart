import 'package:flutter/material.dart';
import 'package:scholarship_hub/res/MyTheme/theme_extension.dart';
import '../../res/CommonWidgets/AppText/app_text.dart';

class SendFeedbackScreen extends StatefulWidget {
  const SendFeedbackScreen({super.key});

  @override
  State<SendFeedbackScreen> createState() => _SendFeedbackScreenState();
}

class _SendFeedbackScreenState extends State<SendFeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      appBar: AppBar(
        backgroundColor: context.customTheme.bgcolor,
        title: AppText(text: 'Send Feedback Screen',),
        centerTitle: true,
      ),
    );
  }
}
