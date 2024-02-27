import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/models/news.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseStorageInstance = FirebaseStorage.instance;
final firebaseFirestore = FirebaseFirestore.instance;

class NewsCard extends StatefulWidget {
  const NewsCard({Key? key, required this.news}) : super(key: key);
  final News news;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  late Future<List<News>> _newsListFuture;
  Future<List<News>> _getNewslist() async {
    final user = firebaseAuthInstance.currentUser;
    final userDocRef = firebaseFirestore.collection("users").doc(user!.uid);

// Belirli belgeye ait alt koleksiyona erişin
    var newsListcollectionRef = userDocRef.collection('newsList');
    var querySnapshot = await newsListcollectionRef.get();

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
    _newsListFuture = _getNewslist();
  }

  @override
  Widget build(BuildContext context) {
    Timestamp timestamp = widget.news.newsDate;
    String newsDateString = timestamp.toDate().toString();
    MediaQueryData mediaQuery = MediaQuery.of(context);
    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;

    return FutureBuilder<List<News>>(
      future: _newsListFuture,
      builder: (context, snapshot) {
        final newsList = snapshot.data ?? [];
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                  strokeAlign: BorderSide.strokeAlignCenter),
            ),
          ); // Veri yüklenirken bekleyici göster
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (newsList.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                    color: Theme.of(context).colorScheme.secondary, width: 8),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/surveyError.png",
                    height: 150,
                  ),
                  const Text(
                    "Tanımlanmış herhangi bir sınavınız bulunmamaktadır.",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        } else {
          // Veri başarıyla geldiyse
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: screenWidth,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 6,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Duyuru",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "İstanbul Kodluyor",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            widget.news.title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.calendar_month_outlined),
                          Text(
                            newsDateString,
                            style: const TextStyle(fontSize: 14),
                          ),
                          const Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Devamını Oku",
                                style: TextStyle(
                                  color: Color.fromRGBO(93, 5, 118, 0.9),
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
