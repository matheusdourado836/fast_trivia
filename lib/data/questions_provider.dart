import 'package:fast_trivia/models/quiz_model.dart';
import 'package:flutter/material.dart';
import '../services/firebase_db_service.dart';
import '../services/quiz_service.dart';

class QuestionsProvider extends ChangeNotifier {
  final QuizService _quizService = QuizService();
  final List<int> _answers = [];
  List<Quiz> _listQuestions = [];
  late Quiz _quiz;
  String _username = '';
  int _currentQuestion = 1;

  int get currentQuestion => _currentQuestion;

  List<int> get answers => _answers;

  String get username => _username;

  bool _endButton = false;

  bool get endButton => _endButton;

  set newUsername(String newUsername) {
    _username = newUsername;
  }

  set newCurrentQuestion(int newQuestionIndex) {
    _currentQuestion = newQuestionIndex;

    notifyListeners();
  }

  void newUserAnswer(int userAnswer, int questionId) {
    Questoes question = _quiz.questionario.questoes.where((element) => element.id == questionId).first;
    question.userAnswer = userAnswer;
  }

  Future<Quiz?> getQuiz() async {
    final db = FirebaseDbService();
    final listQuizDb = await db.loadUserQuiz(username);
    _listQuestions = await _quizService.getAll();
    final List<int> listIds = [];
    for(var quizDB in listQuizDb) {
      listIds.add(int.parse(quizDB.id));
    }
    for (var quiz in _listQuestions) {
      final jsonQuiz = Quiz(questionario: quiz.questionario).toJson();
      if (!listIds.contains(jsonQuiz["questionario"]["id"])) {
        _quiz = quiz;
        return quiz;
      }
    }

    return null;
  }

  void showEndButton(bool value) {
    _endButton = value;

    notifyListeners();
  }

  Map<String, dynamic> calculateResults(List<Questoes> questionsList) {
    final Map<String, dynamic> scoreObj = {};
    final List<int> correctAnswers = [];
    for(int i = 0; i < questionsList.length; i++) {
      if(questionsList[i].gabarito == questionsList[i].userAnswer) {
        correctAnswers.add(i);
      }
    }
    scoreObj["qtdQuestoes"] = questionsList.length;
    scoreObj["qtdCorrectAnswers"] = correctAnswers.length;
    scoreObj["scorePercentage"] = (correctAnswers.length * 100) / questionsList.length;

    return scoreObj;
  }
}