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

  @override
  String toString() => this.title;
}
