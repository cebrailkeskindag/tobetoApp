import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/models/edu.dart';
import 'package:tobetoapp/models/modelcatolag.dart';
import 'package:tobetoapp/models/profile_edit.dart';
import 'package:tobetoapp/widgets/catalog/catalog_widget.dart';
import 'package:tobetoapp/widgets/homepage/trainings_card.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseStorageInstance = FirebaseStorage.instance;
final firebaseFirestore = FirebaseFirestore.instance;

class CatalogFirebase extends StatefulWidget {
  const CatalogFirebase({Key? key}) : super(key: key);

  @override
  _CatalogFirebaseState createState() => _CatalogFirebaseState();
}

class _CatalogFirebaseState extends State<CatalogFirebase> {
  late Future<List<ModelCatalog>> _catalogListFuture;

  Future<List<ModelCatalog>> _getCatalogListlist() async {
    final userDocRef = firebaseFirestore.collection("catalogList");

    var querySnapshot = await userDocRef.get();

    final catalogList = querySnapshot.docs.map((doc) {
      final data = doc.data();
      return ModelCatalog.fromJson(data);
    }).toList();

    // Mesajları tarihe göre sırala
    catalogList.sort((a, b) {
      return a.date.compareTo(b.date);
    });

    return catalogList;
  }

  @override
  void initState() {
    super.initState();
    _catalogListFuture = _getCatalogListlist();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;

    return FutureBuilder<List<ModelCatalog>>(
      future: _catalogListFuture,
      builder: (context, snapshot) {
        final catalogList = snapshot.data ?? [];
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (catalogList.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/surveyError.png",
                    height: 150,
                  ),
                  const Text(
                    "Henüz eğitim eklenmedi.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        } else {
          // Veri başarıyla geldiyse
          return Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SizedBox(
              width: screenWidth,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (ModelCatalog catalog in catalogList)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0), // Boşluk ekle
                        child: CatalogWidget(catalogModel: catalog),
                      ),
                    SizedBox(
                      width: screenWidth * 0.75,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(0.3), // Gölge rengi
                                      spreadRadius: 4, // Yayılma yarıçapı
                                      blurRadius: 10, // Bulanıklık yarıçapı
                                      // Gölgeyi kaydırma
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    // IconButton'a basıldığında yapılacak işlemler
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Text("Daha Fazla Göster")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
