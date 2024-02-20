import 'package:cloud_firestore/cloud_firestore.dart';

class Education {
  // Ctor'da default değer
  const Education({
    required this.id,
    required this.uid,
    required this.startTime,
    required this.finishTime,
    required this.author,
    required this.title,
    required this.imageUrl,
  });

  final String id;
  final String uid;
  final Timestamp startTime;
  final Timestamp finishTime;
  final String title;
  final String author;
  final String imageUrl;

    factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json['id'],
        uid: json['uid'],
        startTime: json['startTime'],
        finishTime: json['finishTime'],
        title: json['title'],
        author: json['author'],
        imageUrl: json['author'],
      );
}


