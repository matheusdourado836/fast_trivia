import 'package:fast_trivia/responsive/responsive_layout.dart';
import 'package:fast_trivia/screens/quiz/devices/quiz_screen_desktop.dart';
import 'package:fast_trivia/screens/quiz/devices/quiz_screen_mobile.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScreen: QuizScreenMobile(),
      desktopScreen: QuizScreenDesktop()
    );
  }
}