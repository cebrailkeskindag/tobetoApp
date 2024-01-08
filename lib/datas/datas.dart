import 'package:tobetoapp/models/catalog_model.dart';
import 'package:tobetoapp/models/education.dart';
import 'package:tobetoapp/models/exam.dart';
import 'package:tobetoapp/models/news.dart';
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

const educationList = [
  Education(
      id: "1",
      startTime: "2024.01.08",
      finishTime: "2024.10.25",
      author: "Ahmet Çetinkaya",
      title: ".NET & React Fullstack - 1A"),
      
];
