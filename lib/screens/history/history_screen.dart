import 'package:fast_trivia/responsive/responsive_layout.dart';
import 'package:fast_trivia/screens/history/devices/history_screen_desktop.dart';
import 'package:fast_trivia/screens/history/devices/history_screen_mobile.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScreen: HistoryScreenMobile(),
      desktopScreen: HistoryScreenDesktop()
    );
  }
}
