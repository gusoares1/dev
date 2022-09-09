import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/splash/Models/question_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

final controller = ChallengerControler();
final pageController = PageController();

class _ChallengePageState extends State<ChallengePage> {
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    pageController.nextPage(
        duration: Duration(seconds: 1), curve: Curves.linear);
  }

  void onSeleced(bool value) {
    if (value) {
      controller.qtdAwserRigth++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    currentePage: value,
                    lenght: widget.questions.length,
                  ),
                )
              ],
            ),
          ),
          preferredSize: Size.fromHeight(87),
        ),
        body: PageView(
          controller: pageController,
          children: widget.questions
              .map(
                (e) => QuizWidget(
                  question: e,
                  onSelected: onSeleced,
                ),
              )
              .toList(),
        ),
        bottomNavigationBar: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: NextbuttonWidget.white(
                        label: "Pular",
                        onTap: nextPage,
                      ),
                    ),
                    if (value == widget.questions.length)
                      SizedBox(
                        width: 7,
                      ),
                    if (value == widget.questions.length)
                      Expanded(
                        child: NextbuttonWidget.green(
                          label: "Confirmar",
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                        result: controller.qtdAwserRigth,
                                        title: widget.title,
                                        length: widget.questions.length,
                                      )),
                            );
                          },
                        ),
                      ),
                  ],
                )));
  }
}
