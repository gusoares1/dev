import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/home_repository.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/splash/Models/awnsers_model.dart';
import 'package:DevQuiz/splash/Models/question_model.dart';
import 'package:DevQuiz/splash/Models/quiz_model.dart';
import 'package:DevQuiz/splash/Models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final stateNotifier = ValueNotifier<homeSatate>(homeSatate.empety);
  set state(homeSatate state) => stateNotifier.value = state;
  homeSatate get state => stateNotifier.value;

  UserModerl? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = homeSatate.loading;
    user = await repository.getUser();
    state = homeSatate.success;
  }

  void getQuizzes() async {
    state = homeSatate.loading;
    quizzes = await repository.getQuizzes();
    state = homeSatate.success;
  }
}
