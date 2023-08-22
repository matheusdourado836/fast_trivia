import 'package:fast_trivia/commons/my_appbar.dart';
import 'package:fast_trivia/commons/skeleton_list_loader.dart';
import 'package:fast_trivia/data/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/questions_provider.dart';
import '../../../models/quiz_model.dart';
import '../../../themes/my_theme.dart';

class HistoryScreenDesktop extends StatefulWidget {
  const HistoryScreenDesktop({super.key});

  @override
  State<HistoryScreenDesktop> createState() => _HistoryScreenDesktopState();
}

class _HistoryScreenDesktopState extends State<HistoryScreenDesktop> {

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
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: const Center(child: Text('Você ainda não tem nenhum questionário respondido...', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))));
                    }

                    return SizedBox(
                      width: MediaQuery.of(context).size.width * .7,
                      height: MediaQuery.of(context).size.height * .8,
                      child: ListView.builder(itemCount: snapshot.data!.length, shrinkWrap: true, itemBuilder: (context, index) {
                        final quiz = snapshot.data![index];
                        final scoreObj = questionProvider.calculateResults(quiz.questionario.questoes);
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 16.0),
                          child: ListTile(
                            tileColor: MyTheme.primaryColor.withOpacity(.85),
                            minVerticalPadding: 24.0,
                            minLeadingWidth: 40,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                            leading: const Icon(Icons.question_mark_rounded, color: Colors.yellow, size: 32,),
                            title: Text(quiz.questionario.titulo, style: const TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text('Você acertou ${scoreObj["scorePercentage"]}%   (${scoreObj["qtdCorrectAnswers"]} / ${scoreObj["qtdQuestoes"]})'),
                            trailing: ElevatedButton(
                                onPressed: (() {
                                  Navigator.pushNamed(context, 'answers', arguments: {"listQuestions": quiz.questionario.questoes});
                                }),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyTheme.secondaryColor,
                                  foregroundColor: MyTheme.backgroundColor,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                child: const Text('ver resultado')
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
