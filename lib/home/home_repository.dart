import 'dart:convert';

import 'package:DevQuiz/splash/Models/quiz_model.dart';
import 'package:DevQuiz/splash/Models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModerl> getUser() async {
    final response = await rootBundle.loadString("assets/database/user.json");
    final user = UserModerl.fromJson(response);
    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response =
        await rootBundle.loadString("assets/database/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }
}
