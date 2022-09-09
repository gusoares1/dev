import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModerl {
  final String name;
  final String photoUrl;
  final int score;
  UserModerl({
    required this.name,
    required this.photoUrl,
    this.score = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'photoUrl': photoUrl,
      'score': score,
    };
  }

  factory UserModerl.fromMap(Map<String, dynamic> map) {
    return UserModerl(
      name: map['name'] as String,
      photoUrl: map['photoUrl'] as String,
      score: map['score'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModerl.fromJson(String source) =>
      UserModerl.fromMap(json.decode(source) as Map<String, dynamic>);
}
