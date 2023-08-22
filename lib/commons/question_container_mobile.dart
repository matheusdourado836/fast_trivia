import 'package:fast_trivia/data/questions_provider.dart';
import 'package:fast_trivia/themes/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/quiz_model.dart';

class QuestionContainerMobile extends StatelessWidget {
  final String title;
  final String question;
  final List<Questoes> questionsMap;

  const QuestionContainerMobile(
      {super.key,
        required this.title,
        required this.question,
        required this.questionsMap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: MyTheme.questionContainerColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 2.0),
          boxShadow: kElevationToShadow[1]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Text(
            question,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          ActiveOptions(questions: questionsMap)
        ],
      ),
    );
  }
}

class ActiveOptions extends StatefulWidget {
  final List<Questoes> questions;

  const ActiveOptions({super.key, required this.questions});

  @override
  State<ActiveOptions> createState() => _ActiveOptionsState();
}

class _ActiveOptionsState extends State<ActiveOptions> {

  void setSelectedValue(int value, int questionId, QuestionsProvider questionsProvider) {
    questionsProvider.newUserAnswer(value, questionId);
    setState(() {});

    for(var question in widget.questions) {
      if(question.userAnswer == null) {
        return;
      }
    }
    questionsProvider.showEndButton(true);
  }

  @override
  Widget build(BuildContext context) {
    final questionsProvider = Provider.of<QuestionsProvider>(context, listen: false);
    final alternativas = widget.questions[questionsProvider.currentQuestion - 1].alternativas;
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: alternativas.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: InkWell(
              onTap: (() {
                setSelectedValue(alternativas.indexOf(alternativas[index]) + 1, widget.questions[questionsProvider.currentQuestion - 1].id, questionsProvider);
              }),
              child: Row(
                children: [
                  Radio<int>(
                    value: alternativas.indexOf(alternativas[index]) + 1,
                    groupValue: widget.questions[questionsProvider.currentQuestion - 1].userAnswer,
                    onChanged: (int? value) {
                      setSelectedValue(value!, widget.questions[questionsProvider.currentQuestion - 1].id, questionsProvider);
                    },
                  ),
                  Text(
                    alternativas[index].titulo,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
            ),
          );
        });
  }
}



