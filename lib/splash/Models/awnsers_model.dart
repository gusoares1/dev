// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AwnsersModel {
  final String title;
  final bool isRight;

  AwnsersModel({
    required this.title,
    this.isRight = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isRight': isRight,
    };
  }

  factory AwnsersModel.fromMap(Map<String, dynamic> map) {
    return AwnsersModel(
      title: map['title'],
      isRight: map['isRight'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AwnsersModel.fromJson(String source) =>
      AwnsersModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
