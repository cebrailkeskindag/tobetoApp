import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/models/perfection.dart';




final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseStorageInstance = FirebaseStorage.instance;
final firebaseFirestore = FirebaseFirestore.instance;

class PerfectionList extends StatefulWidget {
  const PerfectionList({
    Key? key,
  }) : super(key: key);

  @override
  _PerfectionListState createState() => _PerfectionListState();
}

class _PerfectionListState extends State<PerfectionList> {
  late Future<List<PerfectionModel>> _perfectionListFuture;

  Future<List<PerfectionModel>> _getPerfectionlist() async {
    final user = firebaseAuthInstance.currentUser;
    final userDocRef = firebaseFirestore.collection("users").doc(user!.uid);

// Belirli belgeye ait alt koleksiyona erişin
    var perfectionListCollectionRef = userDocRef.collection('perfections');
    var querySnapshot = await perfectionListCollectionRef.get();

    final perfectionList = querySnapshot.docs.map((doc) {
      final data = doc.data();
      return PerfectionModel.fromJson(data);
    }).toList();

   
    perfectionList.sort((a, b) {
      return a.date.compareTo(b.date);
    });

    return perfectionList;
  }

  @override
  void initState() {
    super.initState();
    _perfectionListFuture =  _getPerfectionlist();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;

    return FutureBuilder<List<PerfectionModel>>(
      future: _perfectionListFuture,
      builder: (context, snapshot) {
        final perfectionList = snapshot.data ?? [];
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Veri yüklenirken bekleyici göster
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (perfectionList.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child:Text(
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
                  for (PerfectionModel perfection in perfectionList) Text("${perfection.perfection}, "),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
