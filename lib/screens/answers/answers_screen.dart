import 'package:flutter/material.dart';
import '../../commons/answered_container.dart';
import '../../commons/my_appbar.dart';
import '../../models/quiz_model.dart';
import '../../themes/my_theme.dart';

class AnswerScreen extends StatefulWidget {
  final List<Questoes> listQuestions;
  const AnswerScreen({super.key, required this.listQuestions});

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'Suas respostas'),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 80,
          child: ListView.builder(itemCount: widget.listQuestions.length, shrinkWrap: true, itemBuilder: (context, index) {
            final question = widget.listQuestions[index];
            return Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                width: 600,
                height: 450,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: MyTheme.questionContainerColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: (question.gabarito == question.userAnswer) ? Colors.green : Colors.red, width: 2.0),
                    boxShadow: kElevationToShadow[2]
                ),
                child: AnsweredList(
                    title: question.titulo,
                    question: question.pergunta,
                    questionsMap: widget.listQuestions,
                    currentQuestion: index,
                    borderColor: (question.gabarito == question.userAnswer) ? Colors.green : Colors.red
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
