import 'package:fast_trivia/responsive/responsive_layout.dart';
import 'package:fast_trivia/screens/home/devices/home_screen_desktop.dart';
import 'package:fast_trivia/screens/home/devices/home_screen_mobile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScreen: HomeScreenMobile(),
      desktopScreen: HomeScreenDesktop()
    );
  }
}
