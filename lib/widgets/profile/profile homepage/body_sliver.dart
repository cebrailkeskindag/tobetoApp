import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/models/profile_edit.dart';
import 'package:tobetoapp/widgets/profile/profil%20edit/perfectionlist.dart';
import 'package:tobetoapp/widgets/profile/profile%20homepage/activite_map.dart';

 final firebaseAuthInstance = FirebaseAuth.instance;

  final firebaseFireStore = FirebaseFirestore.instance;
class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.size,required this.aboutMe
  }) : super(key: key);

  final Size size;
  final String aboutMe;
  

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 20.0),
              child: Text(
                'Hakkımda',
                style: TextStyle(fontSize: 23),
              ),
            ),
            const Divider(),
             Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                aboutMe,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Yetkinliklerim",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(),
                    ),
                   // Text("Henüz bir yetkinlik eklemedin")
                   PerfectionList()
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Yabancı Dillerim",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(),
                    ),
                    Text("Henüz bir yabancı dil eklemedin")
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sertifikalarım",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(),
                    ),
                    Text("Henüz bir sertifika eklemedin")
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              shadowColor: Theme.of(context).colorScheme.background,
              elevation: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Medya Hesaplarım",
                        style: TextStyle(fontSize: 20)),
                    const Divider(thickness: 2),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(25),
                            onTap: () {},
                            child: Image.asset(
                              "assets/images/link.png",
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(25),
                            onTap: () {},
                            child: Image.asset(
                              "assets/images/github.png",
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(25),
                            onTap: () {},
                            child: Image.asset(
                              "assets/images/flogo.png",
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Tobeto İşte Başarı Modelim",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility))
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(),
                    ),
                    const Text(
                      "İşte Başarı Modeli değerlendirmesiyle yetkinliklerini ölç",
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {}, child: const Text("Başla")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              child: Column(
                children: [
                  const Text(
                    "Tobeto Seviye Testlerim",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 120,
                              width: 300,
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Herkes için Kodlama 2A Değerlendirme Sınavı",
                                    softWrap: true,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Divider(),
                                  ),
                                  Row(
                                    children: [
                                      Text("16.10.2023"),
                                      Spacer(),
                                      Text("72.00"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 120,
                              width: 300,
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Masaüstü Programlama",
                                    softWrap: true,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Divider(),
                                  ),
                                  Row(
                                    children: [
                                      Text("15.10.2023"),
                                      Spacer(),
                                      Text("50.00"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 10),
              child: Text(
                'Yetkinlik Rozetlerim',
                style: TextStyle(fontSize: 23),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      8,
                      (index) => Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                height: size.height * 0.18,
                                width: size.width * 0.23,
                                image: const AssetImage(
                                    'assets/images/iconlogo.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ))),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                elevation: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Aktivite Haritam",
                        style: TextStyle(fontSize: 20),
                      ),
                      const Divider(thickness: 2),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 7,
                        child: const ActivityMap(),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ActivityMapContainerWidget(
                              color: Colors.grey,
                            ),
                            ActivityMapContainerWidget(
                              color: Color(0xFFBB66FF),
                            ),
                            ActivityMapContainerWidget(
                              color: Color(0xFF9933FF),
                            ),
                            ActivityMapContainerWidget(
                              color: Color(0xFF5C1F99),
                            ),
                            ActivityMapContainerWidget(
                              color: Color(0xFF361259),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}
