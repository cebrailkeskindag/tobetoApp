import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tobetoapp/constants/constants_firabase.dart';
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
  
  late Future<List<News>> _newsListFuture;

  Future<List<News>> _getNewslist() async {
  
    var newsListCollectionRef = firebaseFirestore.collection(ConstanstFirebase.NEWS_LIST);
    var querySnapshot = await newsListCollectionRef.get();

    final newsList = querySnapshot.docs.map((doc) {
      final data = doc.data();
      return News.fromJson(data);
    }).toList();

    newsList.sort((a, b) {
      return a.newsDate.compareTo(b.newsDate);
    });

    return newsList;
  }

  @override
  void initState() {
    super.initState();
   
    _newsListFuture = _getNewslist();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    double screenWidth = mediaQuery.size.width;

    return FutureBuilder<List<News>>(
      future: _newsListFuture,
      builder: (context, snapshot) {
        final newsList = snapshot.data ?? [];
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();  
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
