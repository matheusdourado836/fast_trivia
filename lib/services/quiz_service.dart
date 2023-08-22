import 'package:fast_trivia/models/quiz_model.dart';
import 'package:fast_trivia/questions.dart';

class QuizService {
  Future<List<Quiz>> getAll() async {
    List<Map<String, dynamic>> listQuiz = questions;

    List<Quiz> result = [];

    for(var jsonMap in listQuiz) {
      result.add(Quiz.fromJson(jsonMap));
    }

    await Future.delayed(const Duration(milliseconds: 1500), () {});

    return result;
  }
}