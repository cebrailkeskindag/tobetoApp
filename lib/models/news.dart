import 'package:cloud_firestore/cloud_firestore.dart';

class News {
  // Ctor'da default değer
  const News(
      {required this.id,
      required this.uid,
      required this.title,
      required this.newsDate});

  final String id;
  final String title;
  final Timestamp newsDate;
  final String uid;

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json['id'],
        uid: json['uid'],
        title: json['title'],
        newsDate: json['newsDate'],
      );

}
