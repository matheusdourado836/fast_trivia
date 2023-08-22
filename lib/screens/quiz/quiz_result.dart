import 'package:fast_trivia/commons/my_appbar.dart';
import 'package:fast_trivia/themes/my_theme.dart';
import 'package:flutter/material.dart';
import '../../models/quiz_model.dart';

class QuizResult extends StatelessWidget {
  final List<Questoes> listQuestions;
  final Map<String, dynamic> scoreObj;
  const QuizResult({super.key, required this.listQuestions, required this.scoreObj});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'Questionário Finalizado', leading: IconButton(onPressed: (() {Navigator.pushReplacementNamed(context, 'user');}), icon: const Icon(Icons.home))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Text(
                'Pontuação: ${scoreObj["qtdCorrectAnswers"]} / ${scoreObj["qtdQuestoes"]}  (${scoreObj["scorePercentage"]}%)',
                 style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            MyTheme().customElevatedButton(
              function: (() {Navigator.pushNamed(context, 'answers', arguments: {"listQuestions": listQuestions});}),
              backgroundColor: MyTheme.secondaryColor,
              child: const Text('ver suas respostas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: MyTheme.backgroundColor))
            )
          ],
        ),
      ),
    );
  }
}
