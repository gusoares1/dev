// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:DevQuiz/splash/Models/awnsers_model.dart';

class QuestionModel {
  final String title;
  final List<AwnsersModel> awnsers;

  QuestionModel({required this.title, required this.awnsers})
      : assert(
          awnsers.length == 4,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'awnsers': awnsers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'] as String,
      awnsers: List<AwnsersModel>.from(
        (map['awnsers'] as List<dynamic>).map<AwnsersModel>(
          (x) => AwnsersModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
