import 'package:flutter/material.dart';

class CurrentQuestionDivider extends StatelessWidget {
  final int currentQuestion;
  final int qtdQuestions;
  const CurrentQuestionDivider({super.key, required this.qtdQuestions, required this.currentQuestion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 2,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('$currentQuestion de $qtdQuestions', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          ),
          Expanded(
            child: Container(
              height: 2,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}