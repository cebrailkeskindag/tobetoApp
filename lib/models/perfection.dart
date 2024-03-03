import 'package:cloud_firestore/cloud_firestore.dart';

class LanguageModel {
  final String perfection;
  final Timestamp date;

  LanguageModel({required this.perfection, required this.date});

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      perfection: json['perfection'],
      date: json['date'],
    );
  }
}
