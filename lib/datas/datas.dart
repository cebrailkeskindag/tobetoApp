// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tobetoapp/models/calendar_model.dart';
import 'package:tobetoapp/models/catalog_model.dart';
import 'package:tobetoapp/models/homepagemodel.dart';
import 'package:tobetoapp/models/profile_edit.dart';
import 'package:tobetoapp/screen/homepage_screen.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseStorageInstance = FirebaseStorage.instance;
final firebaseFirestore = FirebaseFirestore.instance;
/*
const newsList = [
  News(
      id: "1",
      title: "Yeni Grupların Discord'a Katılımı",
      newsDate: "07.12.2023",
      uid: ''),
  News(
      id: "2",
      title: "4 Aralık Online Hoşgeldin Buluşması",
      newsDate: "29.11.2023",
      uid: ''),
  News(id: "3", title: "Önemli Bilgilendirme", newsDate: "23.11.2023", uid: ''),
];*/

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
/*
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
*/
/*
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
*/
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
  Educator(eduName: "Ahmet Yılmaz"),
  Educator(eduName: "Ayşe Kaya"),
  Educator(eduName: "Mustafa Aydın"),
  Educator(eduName: "Zeynep Yıldız"),
  Educator(eduName: "Emre Demir"),
];

List<SocialMedia> socialmedias = [
  SocialMedia(name: "Instagram"),
  SocialMedia(name: "Twitter"),
  SocialMedia(name: "Linkedn"),
  SocialMedia(name: "Github"),
  SocialMedia(name: "Dribble"),
  SocialMedia(name: "Behance"),
];

List<Province> provinces = [
  Province(city: 'Adana'),
  Province(city: 'Adıyaman'),
  Province(city: 'Afyonkarahisar'),
  Province(city: 'Ağrı'),
  Province(city: 'Aksaray'),
  Province(city: 'Amasya'),
  Province(city: 'Ankara'),
  Province(city: 'Antalya'),
  Province(city: 'Ardahan'),
  Province(city: 'Artvin'),
  Province(city: 'Aydın'),
  Province(city: 'Balıkesir'),
  Province(city: 'Bartın'),
  Province(city: 'Batman'),
  Province(city: 'Bayburt'),
  Province(city: 'Bilecik'),
  Province(city: 'Bingöl'),
  Province(city: 'Bitlis'),
  Province(city: 'Bolu'),
  Province(city: 'Burdur'),
  Province(city: 'Bursa'),
  Province(city: 'Çanakkale'),
  Province(city: 'Çankırı'),
  Province(city: 'Çorum'),
  Province(city: 'Denizli'),
  Province(city: 'Diyarbakır'),
  Province(city: 'Düzce'),
  Province(city: 'Edirne'),
  Province(city: 'Elazığ'),
  Province(city: 'Erzincan'),
  Province(city: 'Erzurum'),
  Province(city: 'Eskişehir'),
  Province(city: 'Gaziantep'),
  Province(city: 'Giresun'),
  Province(city: 'Gümüşhane'),
  Province(city: 'Hakkâri'),
  Province(city: 'Hatay'),
  Province(city: 'Iğdır'),
  Province(city: 'Isparta'),
  Province(city: 'İstanbul'),
  Province(city: 'İzmir'),
  Province(city: 'Kahramanmaraş'),
  Province(city: 'Karabük'),
  Province(city: 'Karaman'),
  Province(city: 'Kars'),
  Province(city: 'Kastamonu'),
  Province(city: 'Kayseri'),
  Province(city: 'Kırıkkale'),
  Province(city: 'Kırklareli'),
  Province(city: 'Kırşehir'),
  Province(city: 'Kilis'),
  Province(city: 'Kocaeli'),
  Province(city: 'Konya'),
  Province(city: 'Kütahya'),
  Province(city: 'Malatya'),
  Province(city: 'Manisa'),
  Province(city: 'Mardin'),
  Province(city: 'Mersin'),
  Province(city: 'Muğla'),
  Province(city: 'Muş'),
  Province(city: 'Nevşehir'),
  Province(city: 'Niğde'),
  Province(city: 'Ordu'),
  Province(city: 'Osmaniye'),
  Province(city: 'Rize'),
  Province(city: 'Sakarya'),
  Province(city: 'Samsun'),
  Province(city: 'Şanlıurfa'),
  Province(city: 'Siirt'),
  Province(city: 'Sinop'),
  Province(city: 'Şırnak'),
  Province(city: 'Sivas'),
  Province(city: 'Tekirdağ'),
  Province(city: 'Tokat'),
  Province(city: 'Trabzon'),
  Province(city: 'Tunceli'),
  Province(city: 'Uşak'),
  Province(city: 'Van'),
  Province(city: 'Yalova'),
  Province(city: 'Yozgat'),
  Province(city: 'Zonguldak'),
];

List<Education> educationLevels = [
  Education(eduLevel: " Lisans"),
  Education(eduLevel: " Ön Lisans"),
  Education(eduLevel: " Yüksek Lisans"),
  Education(eduLevel: " Doktora"),
];

List<Perfection> compets = [
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

List<Language> languages = [
  Language(language: "Almanca"),
  Language(language: "Arapça"),
  Language(language: "Çekçe"),
  Language(language: "Çince(Mandarin)"),
  Language(language: "Danca"),
  Language(language: "Fince"),
  Language(language: "Fransızca"),
  Language(language: "Hindi"),
  Language(language: "Hollandaca"),
  Language(language: "İbranice"),
  Language(language: "İngilizce"),
  Language(language: "İspanyolca"),
  Language(language: "isveççe"),
  Language(language: "İtalyanca"),
  Language(language: "Japonca"),
  Language(language: "Korece"),
  Language(language: "Lehçe"),
  Language(language: "Macarca"),
  Language(language: "Norveççe"),
  Language(language: "Portekizce"),
  Language(language: "Romence"),
  Language(language: "Rusça"),
  Language(language: "Türkçe"),
  Language(language: "Vietnamca"),
  Language(language: "Yunanca"),
];

List<Level> levels = [
  Level(level: "Temel Seviye (A1, A2)"),
  Level(level: "Orta Seviye (B1, B2)"),
  Level(level: "İleri Seviye (C1, C2)"),
  Level(level: "Ana Dil"),
];

/*void _getUserInfo() async {
  final user = firebaseAuthInstance.currentUser;
  final document = firebaseFireStore.collection("users").doc(user!.uid);
  final documentSnapshot = await document.get();
  var eduListCollectionRef = document.collection('educationList').doc("edu4");
  var querySnapshot = await eduListCollectionRef.get();

   if (mounted) {
      setState(() {
        _namePage = documentSnapshot.get("name");
       
      });
    }
  }
  */

List<PageModel> pages = [
  PageModel(title: "TOBETO'ya Hoş geldin!", image: "assets/images/hs1.jpg"),
  PageModel(
      title:
          "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!",
      image: "assets/images/hs2.jpg"),
  PageModel(
      title: "Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.",
      image: "assets/images/hs3.jpg"),
  PageModel(title: "Aradığın  “İş”  Burada!", image: "assets/images/hs4.jpg"),
];
