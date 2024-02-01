// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tobetoapp/models/calendar_model.dart';
import 'package:tobetoapp/models/catalog_model.dart';
import 'package:tobetoapp/models/exam.dart';
import 'package:tobetoapp/models/news.dart';
import 'package:tobetoapp/models/profile_edit.dart';
import 'package:tobetoapp/models/training.dart';

const newsList = [
  News(
      id: "1",
      title: "Yeni Grupların Discord'a Katılımı",
      newsDate: "07.12.2023"),
  News(
      id: "2",
      title: "4 Aralık Online Hoşgeldin Buluşması",
      newsDate: "29.11.2023"),
  News(id: "3", title: "Önemli Bilgilendirme", newsDate: "23.11.2023"),
];

const catalogList = [
  CatalogModel(
    id: "1",
    imagePath: "https://tobeto.s3.cloud.ngn.com.tr/ENK_36573_a8546fa0ff.jpg",
    name: "Gürkan İlişen",
    time: "4s 14dk",
    title: "Dinle, Anla, İfade Et: Etkili İletişim Gelişim Yolculuğu",
  ),
  CatalogModel(
    id: "2",
    imagePath: "https://tobeto.s3.cloud.ngn.com.tr/ENK_365670_08eb2bab1a.jpg",
    name: "Gürkan İlişen ",
    time: "40dk",
    title: "Sürdürülebilir Bir Dünya İçin Bireysel Farkındalık",
  ),
  CatalogModel(
    id: "3",
    imagePath: "https://tobeto.s3.cloud.ngn.com.tr/ENK_365693_fd2d22fa3a.jpg",
    name: "Gürkan İlişen ",
    time: "53dk",
    title: "Hibrit Yaşamda Duyguyu Düzenleme ",
  ),
  CatalogModel(
    id: "4",
    imagePath: "https://tobeto.s3.cloud.ngn.com.tr/ENK_365274_0e51ec7bdb.jpg",
    name: "Gürkan İlişen",
    time: "2s 1dk",
    title: "Web Sayfası Tasarımı Nasıl Oluşturulur?",
  ),
  CatalogModel(
      id: "5",
      imagePath: "https://tobeto.s3.cloud.ngn.com.tr/ENK_365270_7e8908a0c2.jpg",
      name: "Gürkan İlişen ",
      time: "36dk",
      title: "Mehmet Auf ile İyi Günde, Kötü Günde"),
  CatalogModel(
      id: "6",
      imagePath: "https://tobeto.s3.cloud.ngn.com.tr/ENKG_616_3e86ae6eba.jpg",
      name: "Gürkan İlişen",
      time: "1s",
      title: "Programlamanın Tarihçesi ve Gelişimi"),
  CatalogModel(
      id: "7",
      imagePath: "https://tobeto.s3.cloud.ngn.com.tr/ENKG_389_65af6d2667.jpg",
      name: "Gürkan İlişen",
      time: "1s",
      title: "Fiziksel ve Dijital Çalışma Alanınızın Düzenlenmesi "),
  CatalogModel(
      id: "8",
      imagePath: "https://tobeto.s3.cloud.ngn.com.tr/ENKG_275_b356d6fb3d.jpg",
      name: "Gürkan İlişen",
      time: "1s",
      title: "Yazılım Geliştirme ve Programlama Temel Kavramları"),
  CatalogModel(
      id: "9",
      imagePath: "https://tobeto.s3.cloud.ngn.com.tr/ENIB_116_5a33bf9410.jpg",
      name: "Gürkan İlişen ",
      time: "2s",
      title: "Biz Bir Ekibiz"),
  CatalogModel(
      id: "10",
      imagePath: "https://tobeto.s3.cloud.ngn.com.tr/ENIB_238_ea465ab18a.jpg",
      name: "Gürkan İlişen",
      time: "20dk",
      title: "Yaratıcı Düşünme ve İnovasyon Teknikleri "),
  CatalogModel(
      id: "11",
      imagePath: "https://tobeto.s3.cloud.ngn.com.tr/ENIB_210_e8f964f5a9.jpg",
      name: "Gürkan İlişen",
      time: "20dk",
      title: "Problem Çözme Teknikleri"),
  CatalogModel(
      id: "12",
      imagePath: "https://tobeto.s3.cloud.ngn.com.tr/ENIB_195_b77497161b.jpg",
      name: "Gürkan İlişen ",
      time: "17dk",
      title: "Müşteri Ne İster?")
];

const trainingsList = [
  Training(
      id: "1",
      imagePath: "assets/images/ecmal.jpg",
      time: "21 Eylül 2023 15:20",
      title: "Dr. Ecmel Ayral'dan Hoşgeldin Mesajı"),
  Training(
      id: "1",
      imagePath: "assets/images/istkod_egitim.jpg",
      time: "8 Eylül 2023 17:06",
      title: "Eğitimlere Nasıl Katılırım?"),
  Training(
      id: "1",
      imagePath: "assets/images/training3.jpg",
      time: "2 Ekim 2023 03:00",
      title: "Herkes İçin Kodlama - 2A"),
  Training(
      id: "1",
      imagePath: "assets/images/training4.jpg",
      time: "2 Ekim 2023 03:00",
      title: "Hoşgeldin Buluşması - 2"),
];

const examList = [
  Exam(
      id: "1",
      examTitle: "Herkes İçin Kodlama 1A Değerlendirme Sınavı",
      examClass: "Herkes İçin Kodlama 1A",
      examTime: "45 Dakika"),
  Exam(
      id: "2",
      examTitle: "Herkes İçin Kodlama 1B Değerlendirme Sınavı",
      examClass: "Herkes İçin Kodlama 1B",
      examTime: "45 Dakika"),
  Exam(
      id: "3",
      examTitle: "Herkes İçin Kodlama 1C Değerlendirme Sınavı",
      examClass: "Herkes İçin Kodlama 1C",
      examTime: "45 Dakika")
];

List<CalendarModel> educationList = [
  CalendarModel(
      id: "1",
      title: 'Mobil',
      date: DateTime.parse('2024-01-09'),
      hour: 09,
      minute: 00,
      author: "Halit Enes Kalaycı"),
  CalendarModel(
      id: "2",
      title: '.Net',
      date: DateTime.parse('2024-01-09'),
      hour: 10,
      minute: 45,
      author: "Engin Demiroğ"),
  CalendarModel(
      id: "3",
      title: 'Mentor',
      date: DateTime.parse('2024-01-09'),
      hour: 12,
      minute: 30,
      author: "Kader Yavuz"),
  CalendarModel(
      id: "4",
      title: 'Java',
      date: DateTime.parse('2024-01-09'),
      hour: 13,
      minute: 30,
      author: "Ahmet Çetinkaya"),
  CalendarModel(
      id: "5",
      title: 'İş Analisti',
      date: DateTime.parse('2024-01-09'),
      hour: 13,
      minute: 45,
      author: "Ahmet Çetinkaya"),
  CalendarModel(
      id: "6",
      title: 'Örnek Etkinlik 5',
      date: DateTime.parse('2024-01-09'),
      hour: 09,
      minute: 30,
      author: "Ahmet Çetinkaya"),
  CalendarModel(
      id: "7",
      title: 'Örnek Etkinlik 6',
      date: DateTime.parse('2024-01-09'),
      hour: 09,
      minute: 30,
      author: "Ahmet Çetinkaya"),
  CalendarModel(
    id: "8",
    title: 'Mobile',
    date: DateTime.parse('2024-02-09'),
    hour: 14,
    minute: 30,
    author: "Ahmet Çetinkaya",
  ),
];

List<Educator> educators = [
  Educator(tamAd: "Ahmet Yılmaz"),
  Educator(tamAd: "Ayşe Kaya"),
  Educator(tamAd: "Mustafa Aydın"),
  Educator(tamAd: "Zeynep Yıldız"),
  Educator(tamAd: "Emre Demir"),
];

List<SocialMedia> socialmedias = [
  SocialMedia(name: "Instagram"),
  SocialMedia(name: "Twitter"),
  SocialMedia(name: "Linkedn"),
  SocialMedia(name: "Github"),
  SocialMedia(name: "Dribble"),
  SocialMedia(name: "Behance"),
];

List<Province> province = [
  Province(ilAd: 'Adana'),
  Province(ilAd: 'Adıyaman'),
  Province(ilAd: 'Afyonkarahisar'),
  Province(ilAd: 'Ağrı'),
  Province(ilAd: 'Aksaray'),
  Province(ilAd: 'Amasya'),
  Province(ilAd: 'Ankara'),
  Province(ilAd: 'Antalya'),
  Province(ilAd: 'Ardahan'),
  Province(ilAd: 'Artvin'),
  Province(ilAd: 'Aydın'),
  Province(ilAd: 'Balıkesir'),
  Province(ilAd: 'Bartın'),
  Province(ilAd: 'Batman'),
  Province(ilAd: 'Bayburt'),
  Province(ilAd: 'Bilecik'),
  Province(ilAd: 'Bingöl'),
  Province(ilAd: 'Bitlis'),
  Province(ilAd: 'Bolu'),
  Province(ilAd: 'Burdur'),
  Province(ilAd: 'Bursa'),
  Province(ilAd: 'Çanakkale'),
  Province(ilAd: 'Çankırı'),
  Province(ilAd: 'Çorum'),
  Province(ilAd: 'Denizli'),
  Province(ilAd: 'Diyarbakır'),
  Province(ilAd: 'Düzce'),
  Province(ilAd: 'Edirne'),
  Province(ilAd: 'Elazığ'),
  Province(ilAd: 'Erzincan'),
  Province(ilAd: 'Erzurum'),
  Province(ilAd: 'Eskişehir'),
  Province(ilAd: 'Gaziantep'),
  Province(ilAd: 'Giresun'),
  Province(ilAd: 'Gümüşhane'),
  Province(ilAd: 'Hakkâri'),
  Province(ilAd: 'Hatay'),
  Province(ilAd: 'Iğdır'),
  Province(ilAd: 'Isparta'),
  Province(ilAd: 'İstanbul'),
  Province(ilAd: 'İzmir'),
  Province(ilAd: 'Kahramanmaraş'),
  Province(ilAd: 'Karabük'),
  Province(ilAd: 'Karaman'),
  Province(ilAd: 'Kars'),
  Province(ilAd: 'Kastamonu'),
  Province(ilAd: 'Kayseri'),
  Province(ilAd: 'Kilis'),
  Province(ilAd: 'Kırıkkale'),
  Province(ilAd: 'Kırklareli'),
  Province(ilAd: 'Kırşehir'),
  Province(ilAd: 'Kocaeli'),
  Province(ilAd: 'Konya'),
  Province(ilAd: 'Kütahya'),
  Province(ilAd: 'Malatya'),
  Province(ilAd: 'Manisa'),
  Province(ilAd: 'Mardin'),
  Province(ilAd: 'Mersin'),
  Province(ilAd: 'Muğla'),
  Province(ilAd: 'Muş'),
  Province(ilAd: 'Nevşehir'),
  Province(ilAd: 'Niğde'),
  Province(ilAd: 'Ordu'),
  Province(ilAd: 'Osmaniye'),
  Province(ilAd: 'Rize'),
  Province(ilAd: 'Sakarya'),
  Province(ilAd: 'Samsun'),
  Province(ilAd: 'Şanlıurfa'),
  Province(ilAd: 'Siirt'),
  Province(ilAd: 'Sinop'),
  Province(ilAd: 'Sivas'),
  Province(ilAd: 'Şırnak'),
  Province(ilAd: 'Tekirdağ'),
  Province(ilAd: 'Tokat'),
  Province(ilAd: 'Trabzon'),
  Province(ilAd: 'Tunceli'),
  Province(ilAd: 'Uşak'),
  Province(ilAd: 'Van'),
  Province(ilAd: 'Yalova'),
  Province(ilAd: 'Yozgat'),
  Province(ilAd: 'Zonguldak'),
];

List<Education> education = [
  Education(egitim: " Lisans"),
  Education(egitim: " Ön Lisans"),
  Education(egitim: " Yüksek Lisans"),
  Education(egitim: " Doktora"),
];

List<Perfection> compet = [
  Perfection(compet: "C#"),
  Perfection(compet: "Muhasebe"),
  Perfection(compet: "javascript"),
  Perfection(compet: "javascript"),
  Perfection(compet: "Uyum Sağlama"),
  Perfection(compet: "Yönetim ve İdare"),
  Perfection(compet: "Reklam"),
  Perfection(compet: "Android (İşletim Sistemi)"),
  Perfection(compet: "Apache Ambarı"),
  Perfection(compet: "Uygulama Mağazası (IOS)"),
  Perfection(compet: "Apple Sağlık Kiti"),
  Perfection(compet: "Apple İOS"),
  Perfection(compet: "Apple Xcode"),
  Perfection(compet: "Uygulamalı Makine Öğrenimi"),
  Perfection(compet: "Back End (Yazılım Mühendisliği)"),
  Perfection(compet: "Büyük Veri"),
  Perfection(compet: "SQL"),
  Perfection(compet: "BloK Zinciri"),
  Perfection(compet: "Bootstrao (Front-End Framework)"),
  Perfection(compet: "Marka Yönetimi"),
  Perfection(compet: "İletişim"),
  Perfection(compet: "SQL"),
  Perfection(compet: "Pazarlama"),
  Perfection(compet: "Building and Construction"),
];

List<Language> language = [
  Language(dil: "Almanca"),
  Language(dil: "Arapça"),
  Language(dil: "Çekçe"),
  Language(dil: "Çince(Mandarin)"),
  Language(dil: "Danca"),
  Language(dil: "Fince"),
  Language(dil: "Fransızca"),
  Language(dil: "Hindi"),
  Language(dil: "Hollandaca"),
  Language(dil: "İbranice"),
  Language(dil: "İngilizce"),
  Language(dil: "İspanyolca"),
  Language(dil: "isveççe"),
  Language(dil: "İtalyanca"),
  Language(dil: "Japonca"),
  Language(dil: "Korece"),
  Language(dil: "Lehçe"),
  Language(dil: "Macarca"),
  Language(dil: "Norveççe"),
  Language(dil: "Portekizce"),
  Language(dil: "Romence"),
  Language(dil: "Rusça"),
  Language(dil: "Türkçe"),
  Language(dil: "Vietnamca"),
  Language(dil: "Yunanca"),
];

List<Level> level = [
  Level(level: "Temel Seviye (A1, A2)"),
  Level(level: "Orta Seviye (B1, B2)"),
  Level(level: "İleri Seviye (C1, C2)"),
  Level(level: "Ana Dil"),
];
