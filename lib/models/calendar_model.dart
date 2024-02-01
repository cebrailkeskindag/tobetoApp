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

class Educator {
  String tamAd;

  Educator({required this.tamAd});
}

class Province {
  String ilAd;
  Province({
    required this.ilAd,
  });
}

class Education {
  String egitim;
  Education({
    required this.egitim,
  });
}

class Perfection {
  String compet;
  Perfection({
    required this.compet,
  });
}

class Language {
  String dil;
  Language({
    required this.dil,
  });
}

class Level {
  String level;
  Level({
    required this.level,
  });
}
