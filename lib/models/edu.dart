 import 'package:cloud_firestore/cloud_firestore.dart';

class Edu {
  final String id;
  final String uid;
  final String title;
  final String imageUrl;
  final String videoUrl;
  final String videoLength;
  final Timestamp date;

  Edu(
       {required this.id,required this.uid, required this.title, required this.imageUrl, required this.videoUrl, required this.videoLength, required this.date});

  factory Edu.fromJson(Map<String, dynamic> json) => Edu(
        id: json['id'],
        uid: json['uid'],
        title: json['title'],
        imageUrl: json['imageUrl'],
        videoUrl: json['videoUrl'],
        videoLength: json['videoLength'],
        date: json['date'],
      );
}