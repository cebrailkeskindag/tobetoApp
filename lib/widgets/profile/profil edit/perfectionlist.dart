import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/constants/constants_firabase.dart';
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
  late Future<List<LanguageModel>> _perfectionListFuture;

  Future<List<LanguageModel>> _getPerfectionlist() async {
    final user = firebaseAuthInstance.currentUser;
    final userDocRef = firebaseFirestore.collection(ConstanstFirebase.USERS).doc(user!.uid);
 
    var perfectionListCollectionRef = userDocRef.collection(ConstanstFirebase.PERFECTIONS);
    var querySnapshot = await perfectionListCollectionRef.get();

    final perfectionList = querySnapshot.docs.map((doc) {
      final data = doc.data();
      return LanguageModel.fromJson(data);
    }).toList();

    perfectionList.sort((a, b) {
      return a.date.compareTo(b.date);
    });

    return perfectionList;
  }

  @override
  void initState() {
    super.initState();
    _perfectionListFuture = _getPerfectionlist();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;

    return FutureBuilder<List<LanguageModel>>(
      future: _perfectionListFuture,
      builder: (context, snapshot) {
        final perfectionList = snapshot.data ?? [];
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();  
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (perfectionList.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Henüz bir yetkinlik eklemediniz.",
              textAlign: TextAlign.center,
            ),
          );
        } else {
         

          return SizedBox(
            width: screenWidth / 0.20,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (LanguageModel perfection in perfectionList)
                    Text("${perfection.perfection}, "),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
