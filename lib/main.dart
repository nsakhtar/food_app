import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_food/routes/routes.dart';
import 'Pages/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
        useMaterial3: true,
      ),
      getPages: AppRoutes.appRoutes(),
      home: const SplashScreen(),
    );
  }
}
