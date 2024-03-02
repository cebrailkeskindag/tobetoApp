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
  @override
  Widget build(BuildContext context) {
    Timestamp timestamp = widget.news.newsDate;
    String newsDateString = timestamp.toDate().toString();
    MediaQueryData mediaQuery = MediaQuery.of(context);
    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: screenWidth * 0.9,
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
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(widget.news.title),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(widget.news.newsContent),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Kapat'),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Diyalogu kapat
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
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
}
