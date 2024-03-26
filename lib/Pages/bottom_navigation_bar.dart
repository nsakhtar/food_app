import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:recipe_food/Pages/profile_screen.dart';
import 'package:recipe_food/Pages/saved_screen.dart';
import '../Helpers/colors.dart';
import 'homescreen.dart';
import 'notifications_screen.dart';

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({super.key});

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int _bottomNavIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SavedScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Container(
        width: 56.0, // Width and height should be equal to create a circle
        height: 56.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor,
        ),
        child: FloatingActionButton(
          highlightElevation: 0.0,
          splashColor: Colors.transparent,
          onPressed: () {
            // Add your action for the floating action button
          },
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.transparent, // Make the background color transparent
          elevation: 0, // Remove shadow
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: AppColors.primaryColor,
        inactiveColor: AppColors.lightGreyColor,
        icons: [
          Icons.home_outlined,
          Icons.save_alt_sharp,
          Icons.notifications_outlined,
          Icons.person_outline_outlined,
        ],
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        // Other parameters can be added as needed
      ),
      body: _screens[_bottomNavIndex],
    );
  }
}

