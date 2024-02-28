import 'package:cloud_firestore/cloud_firestore.dart';

class PerfectionModel {
  final String perfection;
  final Timestamp date;

  PerfectionModel({required this.perfection, required this.date});

  factory PerfectionModel.fromJson(Map<String, dynamic> json) {
    return PerfectionModel(
      perfection: json['perfection'],
      date: json['date'],
    );
  }
}