import 'package:cloud_firestore/cloud_firestore.dart';

class News {

  const News({
    required this.id,
    required this.uid,
    required this.title,
    required this.newsDate,
    required this.newsContent,
    required this.who,
  });

  final String id;
  final String title;
  final Timestamp newsDate;
  final String uid;
  final String newsContent;
  final String who;

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json['id'],
        uid: json['uid'],
        title: json['title'],
        newsDate: json['newsDate'],
        newsContent: json['content'],
        who: json['who'],
      );
}
