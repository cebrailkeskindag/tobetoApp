import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/models/edu.dart';
import 'package:tobetoapp/models/profile_edit.dart';
import 'package:tobetoapp/widgets/homepage/trainings_card.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseStorageInstance = FirebaseStorage.instance;
final firebaseFirestore = FirebaseFirestore.instance;
class EducationFirebase extends StatefulWidget {
  const EducationFirebase({ Key? key }) : super(key: key);

  @override
  _EducationFirebaseState createState() => _EducationFirebaseState();
}
 
class _EducationFirebaseState extends State<EducationFirebase> {

   late Future<List<Edu>> _eduListFuture;

  Future<List<Edu>> _getEdulist() async {
    final user = firebaseAuthInstance.currentUser;
    final userDocRef = firebaseFirestore.collection("users").doc(user!.uid);

// Belirli belgeye ait alt koleksiyona erişin
    var eduListCollectionRef = userDocRef.collection('educationList');
    var querySnapshot = await eduListCollectionRef.get();
 
    final eduList = querySnapshot.docs.map((doc) {
      final data = doc.data();
      return Edu.fromJson(data);
    }).toList();

    // Mesajları tarihe göre sırala
    eduList.sort((a, b) {
      return a.date.compareTo(b.date);
    });

    return eduList;
  }

  @override
  void initState() {
    super.initState();
    _eduListFuture = _getEdulist();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;

    return FutureBuilder<List<Edu>>(
      future: _eduListFuture,
      builder: (context, snapshot) {
        final eduList = snapshot.data ?? [];
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Veri yüklenirken bekleyici göster
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (eduList.isEmpty) {
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
                    "Tanımlanmış herhangi bir eğitim bulunmamaktadır.",
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
                  for (Edu edu in eduList) TrainingsCard(edu: edu),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}