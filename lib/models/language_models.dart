import 'package:cloud_firestore/cloud_firestore.dart';

class LanguageModel {
  final String language;
  final Timestamp date;
  final String level;

  LanguageModel({
    required this.language,
    required this.date,
    required this.level,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      language: json['language'],
      date: json['date'],
      level: json['level'],
    );
  }
}
