import 'package:fast_trivia/commons/my_appbar.dart';
import 'package:fast_trivia/commons/question_container.dart';
import 'package:fast_trivia/models/quiz_model.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<Questoes> listQuestions;
  final List<Widget> listOptions;
  const ResultScreen({super.key, required this.listQuestions, required this.listOptions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'Sua pontuação'),
      body: SingleChildScrollView(
        child: ListView.builder(itemCount: listQuestions.length, itemBuilder: (context, index) {
          return QuestionContainer(title: listQuestions[index].titulo, question: listQuestions[index].pergunta, questionsMap: listQuestions);
        }),
      ),
    );
  }
}
