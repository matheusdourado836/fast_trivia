import 'package:fast_trivia/commons/my_appbar.dart';
import 'package:fast_trivia/commons/skeleton_list_loader.dart';
import 'package:fast_trivia/data/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/questions_provider.dart';
import '../../../models/quiz_model.dart';
import '../../../themes/my_theme.dart';

class HistoryScreenMobile extends StatefulWidget {
  const HistoryScreenMobile({super.key});

  @override
  State<HistoryScreenMobile> createState() => _HistoryScreenMobileState();
}

class _HistoryScreenMobileState extends State<HistoryScreenMobile> {

  @override
  Widget build(BuildContext context) {
    final questionProvider = Provider.of<QuestionsProvider>(context, listen: false);
    questionProvider.getQuiz();
    return Scaffold(
      appBar: myAppBar(context, 'Seu histórico'),
      body: Consumer<DBProvider>(
        builder: (context, value, _) {
          return SingleChildScrollView(
            child: Center(
              child: FutureBuilder<List<Quiz>>(
                  future: value.loadUserQuiz(questionProvider.username),
                  builder: (context, snapshot) {
                    if(snapshot.data == null) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 32.0),
                        child: SkeletonListLoader(),
                      );
                    }else if(snapshot.data!.isEmpty) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * .8,
                          child: const Center(child: Text('Você ainda não tem nenhum questionário respondido...', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)))
                      );
                    }

                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(itemCount: snapshot.data!.length, shrinkWrap: true, itemBuilder: (context, index) {
                        final quiz = snapshot.data![index];
                        final scoreObj = questionProvider.calculateResults(quiz.questionario.questoes);
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 0),
                          child: Container(
                            height: 100,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: MyTheme.primaryColor,
                              borderRadius: BorderRadius.circular(14)
                            ),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 16.0),
                                  child: Icon(Icons.question_mark_rounded, color: Colors.yellow, size: 28,),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(quiz.questionario.titulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                      Text('Você acertou ${scoreObj["qtdCorrectAnswers"]} / ${scoreObj["qtdQuestoes"]} (${scoreObj["scorePercentage"]}%)', style: const TextStyle(fontSize: 14),),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: (() {
                                      Navigator.pushNamed(context, 'answers', arguments: {"listQuestions": quiz.questionario.questoes});
                                    }),
                                    style: IconButton.styleFrom(
                                      backgroundColor: MyTheme.secondaryColor,
                                      foregroundColor: MyTheme.backgroundColor,
                                      fixedSize: const Size(40, 40),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                    ),
                                    icon: const Icon(Icons.remove_red_eye)
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  }),
            ),
          );
        },
      ),
    );
  }
}
