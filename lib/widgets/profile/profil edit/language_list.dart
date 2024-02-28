import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/models/language_models.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseStorageInstance = FirebaseStorage.instance;
final firebaseFirestore = FirebaseFirestore.instance;

class LanguageList extends StatefulWidget {
  const LanguageList({
    Key? key,
  }) : super(key: key);

  @override
  _LanguageListState createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {
  late Future<List<LanguageModel>> _languageListFuture;

  Future<List<LanguageModel>> _getLanguagelist() async {
    final user = firebaseAuthInstance.currentUser;
    final userDocRef = firebaseFirestore.collection("users").doc(user!.uid);

// Belirli belgeye ait alt koleksiyona erişin
    var languageListCollectionRef = userDocRef.collection('languages');
    var querySnapshot = await languageListCollectionRef.get();

    final languageList = querySnapshot.docs.map((doc) {
      final data = doc.data();
      return LanguageModel.fromJson(data);
    }).toList();

    languageList.sort((a, b) {
      return a.date.compareTo(b.date);
    });

    return languageList;
  }

  @override
  void initState() {
    super.initState();
    _languageListFuture = _getLanguagelist();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;

    return FutureBuilder<List<LanguageModel>>(
      future: _languageListFuture,
      builder: (context, snapshot) {
        final LanguageList = snapshot.data ?? [];
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Veri yüklenirken bekleyici göster
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (LanguageList.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Henüz bir yetkinlik eklemediniz.",
              textAlign: TextAlign.center,
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
                  for (LanguageModel language in LanguageList)
                    Text("${language.language}, "),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
