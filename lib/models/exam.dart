class Exam {
  // Ctor'da default değer
  const Exam(
      {required this.id, required this.examTitle, required this.examClass, required this.examTime});

  final String id;
  final String examTitle;
  final String examClass;
  final String examTime;
}