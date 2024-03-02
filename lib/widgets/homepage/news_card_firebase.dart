import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tobetoapp/models/news.dart';
import 'package:tobetoapp/widgets/homepage/news_card.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseStorageInstance = FirebaseStorage.instance;
final firebaseFirestore = FirebaseFirestore.instance;

class NewsCardFirebase extends StatefulWidget {
  const NewsCardFirebase({Key? key}) : super(key: key);

  @override
  _NewsCardFirebaseState createState() => _NewsCardFirebaseState();
}

class _NewsCardFirebaseState extends State<NewsCardFirebase> {
  void _getUserInfo() async {
    var newsListCollectionRef =
        firebaseFirestore.collection('newsList').doc("news5");
    var querySnapshot = await newsListCollectionRef.get();

    String formatTimestamp(Timestamp timestamp, String format) {
      DateTime dateTime = timestamp.toDate();
      return DateFormat(format).format(dateTime);
    }

    if (mounted) {
      setState(() {
        print("title ${querySnapshot.get("title")}");
        print("content ${querySnapshot.get("content")}");
        print("who ${querySnapshot.get("who")}");
        print(
            "newsDate ${formatTimestamp(querySnapshot.get("newsDate"), 'yyyy-MM-dd – kk:mm')}");
        print("id ${querySnapshot.get("id")}");
        print("uid ${querySnapshot.get("uid")}");
      });
    }
  }

  late Future<List<News>> _newsListFuture;

  Future<List<News>> _getNewslist() async {
    final user = firebaseAuthInstance.currentUser;
    // final userDocRef = firebaseFirestore.collection("users").doc(user!.uid);

// Belirli belgeye ait alt koleksiyona erişin
    var newsListCollectionRef = firebaseFirestore.collection('newsList');
    var querySnapshot = await newsListCollectionRef.get();

    final newsList = querySnapshot.docs.map((doc) {
      final data = doc.data();
      return News.fromJson(data);
    }).toList();

    // Mesajları tarihe göre sırala
    newsList.sort((a, b) {
      return a.newsDate.compareTo(b.newsDate);
    });

    return newsList;
  }

  @override
  void initState() {
    super.initState();
    _getUserInfo();
    _newsListFuture = _getNewslist();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;

    return FutureBuilder<List<News>>(
      future: _newsListFuture,
      builder: (context, snapshot) {
        final newsList = snapshot.data ?? [];
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Veri yüklenirken bekleyici göster
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (newsList.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/surveyError.png",
                    height: 150,
                  ),
                  const Text(
                    "Herhangi bir duyuru bulunmamaktadır.",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        } else {
          // Veri başarıyla geldiyse

          return SizedBox(
            width: screenWidth / 0.20,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (News news in newsList) NewsCard(news: news),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
