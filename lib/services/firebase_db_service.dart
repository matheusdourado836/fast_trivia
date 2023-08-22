import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_trivia/db_firestore.dart';
import '../models/quiz_model.dart';

class FirebaseDbService {
   final FirebaseFirestore _db = DBFirestore.get();

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> loadUserQuiz(String username) async {
    final quizSnapshot = await _db.collection('users').doc(username).collection('historico').get();

    return quizSnapshot.docs;
  }

  void addQuiz(Quiz quiz, String username) async {
    await _db.collection('users/$username/historico').doc(quiz.questionario.id.toString()).set(Quiz(questionario: quiz.questionario).toJson());
  }
}