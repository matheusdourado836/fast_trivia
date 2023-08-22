import 'package:fast_trivia/commons/my_appbar.dart';
import 'package:fast_trivia/commons/question_container.dart';
import 'package:fast_trivia/commons/skeleton_loader.dart';
import 'package:fast_trivia/data/db_provider.dart';
import 'package:fast_trivia/data/questions_provider.dart';
import 'package:fast_trivia/models/quiz_model.dart';
import 'package:fast_trivia/screens/quiz/quiz_result.dart';
import 'package:fast_trivia/screens/quiz/widgets/questions_divider.dart';
import 'package:fast_trivia/themes/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final PageController _pageController = PageController();

class QuizScreenDesktop extends StatefulWidget {
  const QuizScreenDesktop({super.key});

  @override
  State<QuizScreenDesktop> createState() => _QuizScreenDesktopState();
}

class _QuizScreenDesktopState extends State<QuizScreenDesktop> {
  late Future<Quiz?> futureBuilder;

  @override
  void initState() {
    final questionsProvider = Provider.of<QuestionsProvider>(context, listen: false);
    futureBuilder = questionsProvider.getQuiz();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DBProvider>(context, listen: false);
    return Scaffold(
      appBar: myAppBar(context, 'Questionário'),
      body: Center(
        child: FutureBuilder<Quiz?>(
          future: futureBuilder,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const SkeletonLoader();
            }
            if(snapshot.data == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 24.0),
                      child: Text('Você ja respondeu todos os questionarios, parabéns!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                    ),
                    MyTheme().customElevatedButton(
                        function: (() {Navigator.pushReplacementNamed(context, 'user');}),
                        backgroundColor: MyTheme.secondaryColor,
                        child: const Text('Voltar para o início')
                    )
                  ],
                ),
              );
            }
            final questoes = snapshot.data!.questionario.questoes;
            final titulo = snapshot.data!.questionario.titulo;
            return Consumer<QuestionsProvider>(
              builder: (context, value, _) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: Text('TEMA: ${titulo.toUpperCase()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                      ),
                    ),
                    QuestionPageBuilder(
                      questions: questoes,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SizedBox(
                        width: 600,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: (() {
                                  _pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                                }),
                                style: IconButton.styleFrom(
                                    backgroundColor: MyTheme.secondaryColor,
                                    foregroundColor: MyTheme.backgroundColor,
                                    fixedSize: const Size(50, 50)
                                ),
                                icon: const Icon(Icons.arrow_back)
                            ),
                            Expanded(child: CurrentQuestionDivider(currentQuestion: value.currentQuestion, qtdQuestions: questoes.length)),
                            IconButton(
                                onPressed: (() {
                                  if(questoes[value.currentQuestion - 1].userAnswer != null) {
                                    _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                                    value.newUserAnswer(questoes[value.currentQuestion - 1].userAnswer!, questoes[value.currentQuestion - 1].id);
                                  }
                                }),
                                style: IconButton.styleFrom(
                                    backgroundColor: MyTheme.secondaryColor,
                                    foregroundColor: MyTheme.backgroundColor,
                                    fixedSize: const Size(50, 50)
                                ),
                                icon: const Icon(Icons.arrow_forward_rounded)
                            ),
                          ],
                        ),
                      ),
                    ),
                    (value.endButton)
                        ? MyTheme().customElevatedButton(
                        function: (() {
                          value.newUserAnswer(questoes[value.currentQuestion - 1].userAnswer!, questoes[value.currentQuestion - 1].id);
                          dbProvider.addQuiz(value.username, snapshot.data!);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            final Map<String, dynamic> scoreObj = value.calculateResults(questoes);
                            return QuizResult(listQuestions: questoes, scoreObj: scoreObj,);
                          })
                          );
                          value.showEndButton(false);
                        }), backgroundColor: MyTheme.primaryColor, child: const Text('Finalizar', style: TextStyle(fontSize: 18),))
                        : Container()
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class QuestionPageBuilder extends StatefulWidget {
  final List<Questoes> questions;
  const QuestionPageBuilder({super.key, required this.questions});

  @override
  State<QuestionPageBuilder> createState() => _QuestionPageBuilderState();
}

class _QuestionPageBuilderState extends State<QuestionPageBuilder> {
  @override
  Widget build(BuildContext context) {
    final questionsProvider = Provider.of<QuestionsProvider>(context, listen: false);
    return SizedBox(
      width: 600,
      height: 600,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.questions.length,
        itemBuilder: (context, index) {
          return QuestionContainer(
              title: widget.questions[index].titulo,
              question: widget.questions[index].pergunta,
              questionsMap: widget.questions
          );
        },
        onPageChanged: (index) {
          questionsProvider.newCurrentQuestion = index + 1;
        },
      ),
    );
  }
}


