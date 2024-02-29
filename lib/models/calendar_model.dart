class CalendarModel {
  final String id;
  final String title;
  final DateTime date;
  final int hour;
  final int minute;
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
    return CalendarModel(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      hour: json['hour'],
      minute: json['minute'],
      author: json['author'],
    );
  }
}
