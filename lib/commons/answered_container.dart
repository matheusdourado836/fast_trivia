import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import '../themes/my_theme.dart';

class AnsweredList extends StatelessWidget {
  final String title;
  final String question;
  final List<Questoes> questionsMap;
  final int currentQuestion;
  final Color borderColor;
  const AnsweredList({super.key, required this.title, required this.question, required this.questionsMap, required this.borderColor, required this.currentQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        ViewOnlyOptions(
            listQuestions: questionsMap, currentQuestion: currentQuestion,)
        //ActiveOptions(questions: questionsMap)
      ],
    );
  }
}

class ViewOnlyOptions extends StatelessWidget {
  final List<Questoes> listQuestions;
  final int currentQuestion;

  const ViewOnlyOptions(
      {super.key, required this.listQuestions, required this.currentQuestion});

  @override
  Widget build(BuildContext context) {
    final alternativas = listQuestions[currentQuestion].alternativas;
    final userAnswer = listQuestions[currentQuestion].userAnswer;
    final gabarito = listQuestions[currentQuestion].gabarito;
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: alternativas.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: (index + 1 == gabarito)
                ? RadioRow(
              radioValue: alternativas.indexOf(alternativas[index]),
              title: alternativas[index].titulo,
              color: Colors.green,
              backgroundColor: Colors.green,
              selected: (index + 1 == userAnswer) ? true: false,
            )
                : RadioRow(
              radioValue: alternativas.indexOf(alternativas[index]),
              title: alternativas[index].titulo,
              color: (index + 1 == userAnswer) ? Colors.red : Colors.black,
              backgroundColor: (index + 1 == userAnswer) ? Colors.red : MyTheme.questionContainerColor,
              selected: (index + 1 == userAnswer) ? true: false,
            ),
          );
        });
  }
}

class RadioRow extends StatelessWidget {
  final int radioValue;
  final String title;
  final Color color;
  final Color backgroundColor;
  final bool selected;
  const RadioRow({super.key, required this.radioValue, required this.title, required this.color, required this.selected, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(.3),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          Radio<int>(
            value: radioValue,
            groupValue: selected ? radioValue : null,
            hoverColor: Colors.transparent,
            activeColor: color,
            splashRadius: 0,
            onChanged: (int? value) {},
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color
            )
          ),
        ],
      ),
    );
  }
}
