 import 'package:cloud_firestore/cloud_firestore.dart';

class ModelCatalog {
  final String id;
  final String author;
  final String title;
  final String imageUrl;
  final String videoUrl;
  final Timestamp date;

  ModelCatalog(
       {required this.id,required this.author, required this.title, required this.imageUrl, required this.videoUrl, required this.date});

  factory ModelCatalog.fromJson(Map<String, dynamic> json) => ModelCatalog(
        id: json['id'],
        author: json['author'],
        title: json['title'],
        imageUrl: json['imageUrl'],
        videoUrl: json['videoUrl'], 
        date: json['date'],
      );
}