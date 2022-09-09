import 'package:flutter/foundation.dart';

class ChallengerControler {
  final currentPageNotifier = ValueNotifier<int>(0);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  int qtdAwserRigth = 0;
}
