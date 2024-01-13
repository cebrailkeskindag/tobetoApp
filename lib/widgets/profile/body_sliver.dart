import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

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
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                '''
                      ''',
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
                    Text("Henüz bir yetkinlik eklemedin")
                  ],
                ),
              ),
            ),
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
            const Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Medya Hesaplarım",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(),
                    ),
                    Text("Henüz bir hesap eklemedin")
                  ],
                ),
              ),
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
             Card(
              child: Column(
                children: [
                  Text(
                    "Tobeto Seviye Testlerim",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Container(
                              height: 120,width: 300,
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
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Container(
                              height: 120,width: 300,
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
            const SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}
