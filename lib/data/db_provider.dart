import 'package:flutter/material.dart';

import '../models/quiz_model.dart';
import '../services/firebase_db_service.dart';

class DBProvider extends ChangeNotifier {
  List<Quiz> _listQuiz = [];

  List<Quiz> get listQuiz => _listQuiz;

  Future<List<Quiz>> loadUserQuiz(String username) async {
    _listQuiz = [];
    final db = FirebaseDbService();
    final snapshot = await db.loadUserQuiz(username);

    if(snapshot.isNotEmpty) {
      for(var quiz in snapshot) {
        _listQuiz.add(Quiz.fromJson(quiz.data()));
      }
    }

    return _listQuiz;
  }

  void addQuiz(String username, Quiz quiz) {
    final db = FirebaseDbService();

    db.addQuiz(quiz, username);
  }
}