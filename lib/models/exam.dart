import 'package:cloud_firestore/cloud_firestore.dart';

 class Exam {
   final String id;
  final String uid;
  final String examTitle;
  final String examClass;
  final String examTime;
  final Timestamp date;

  Exam(
       {required this.id,required this.uid, required this.examTitle, required this.examClass, required this.examTime, required this.date});

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        id: json['id'],
        uid: json['uid'],
        examTitle: json['examTitle'],
        examClass: json['examClass'],
        examTime: json['examTime'],
        date: json['date'],
      );
}