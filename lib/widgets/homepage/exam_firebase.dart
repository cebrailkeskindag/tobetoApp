import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/constants/constants_firabase.dart';
import 'package:tobetoapp/models/exam.dart';
import 'package:tobetoapp/widgets/homepage/exam_card.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseStorageInstance = FirebaseStorage.instance;
final firebaseFirestore = FirebaseFirestore.instance;

class ExamFirebase extends StatefulWidget {
  const ExamFirebase({
    Key? key,
  }) : super(key: key);

  @override
  _ExamFirebaseState createState() => _ExamFirebaseState();
}

class _ExamFirebaseState extends State<ExamFirebase> {
  late Future<List<Exam>> _examListFuture;

  Future<List<Exam>> _getExamlist() async {
    final user = firebaseAuthInstance.currentUser;
    final userDocRef = firebaseFirestore.collection(ConstanstFirebase.USERS).doc(user!.uid);
 
    var examListCollectionRef = userDocRef.collection(ConstanstFirebase.EXAM_LIST);
    var querySnapshot = await examListCollectionRef.get();

    final examList = querySnapshot.docs.map((doc) {
      final data = doc.data();
      return Exam.fromJson(data);
    }).toList();

     
    examList.sort((a, b) {
      return a.date.compareTo(b.date);
    });

    return examList;
  }

  @override
  void initState() {
    super.initState();
    _examListFuture = _getExamlist();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;

    return FutureBuilder<List<Exam>>(
      future: _examListFuture,
      builder: (context, snapshot) {
        final examList = snapshot.data ?? [];
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();  
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (examList.isEmpty) {
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
                    "Tanımlanmış herhangi bir sınavınız bulunmamaktadır.",
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
                  for (Exam exam in examList) ExamCard(exam: exam),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
