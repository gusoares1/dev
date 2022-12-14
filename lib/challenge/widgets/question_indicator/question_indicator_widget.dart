import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentePage;
  final int lenght;

  const QuestionIndicatorWidget(
      {Key? key, required this.currentePage, required this.lenght})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Questão $currentePage", style: AppTextStyles.body),
              Text("de $lenght", style: AppTextStyles.body),
            ]),
            SizedBox(
              height: 16,
            ),
            ProgressIndicatorWidget(value: currentePage / lenght)
          ],
        ),
      ),
    );
  }
}
