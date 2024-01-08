class CalendarModel {
  final String title;
  final DateTime date;
  final String author;
  CalendarModel({required this.title, required this.date ,required this.author,});

  @override
  String toString() => this.title;
}