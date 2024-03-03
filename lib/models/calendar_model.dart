import 'package:cloud_firestore/cloud_firestore.dart'; 

class CalendarModel {
  final String id;
  final String title;
  final DateTime date;
  final String hour;
  final String minute;
  final String author;

  CalendarModel({
    required this.id,
    required this.title,
    required this.date,
    required this.author,
    required this.hour,
    required this.minute,
  });

  factory CalendarModel.fromJson(Map<String, dynamic> json) {
   
    var dateFromTimestamp = json['date'] is Timestamp
        ? json['date'].toDate()
        : (json['date'] is DateTime
            ? json['date']
            : DateTime.now()); 

    return CalendarModel(
      id: json['id'],
      title: json['title'],
      date: dateFromTimestamp,
      hour: json['hour'],
      minute: json['minute'],
      author: json['author'],
    );
  }
}