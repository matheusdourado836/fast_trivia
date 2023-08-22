import 'package:fast_trivia/data/db_provider.dart';
import 'package:fast_trivia/data/questions_provider.dart';
import 'package:fast_trivia/screens/answers/answers_screen.dart';
import 'package:fast_trivia/screens/history/history_screen.dart';
import 'package:fast_trivia/screens/home/home_screen.dart';
import 'package:fast_trivia/screens/quiz/quiz_screen.dart';
import 'package:fast_trivia/screens/user/user_screen.dart';
import 'package:fast_trivia/themes/my_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => QuestionsProvider()),
      ChangeNotifierProvider(create: (context) => DBProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Trivia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyTheme.primaryColor),
        scaffoldBackgroundColor: MyTheme.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: MyTheme.primaryColor,
          foregroundColor: MyTheme.backgroundColor
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        "home": (context) => const HomeScreen(),
        "quiz": (context) => const QuizScreen(),
        "user": (context) => const UserScreen(),
        "history": (context) => const HistoryScreen(),
      },
      onGenerateRoute: (settings) {
        if(settings.name == 'answers') {
          Map<String, dynamic> routeArgs =
          settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(builder: (context) {
            return AnswerScreen(listQuestions: routeArgs["listQuestions"]);
          });
        }
      },
    );
  }
}
