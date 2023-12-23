import 'package:flutter/material.dart';
import 'package:tobetoapp/widgets/a_card.dart';

import 'package:tobetoapp/widgets/drawer.dart';
import 'package:tobetoapp/widgets/trainings_card.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;

    // Ekran yüksekliği
    double screenHeight = mediaQuery.size.height;
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text("Anasayfa"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "TOBETO",
                          style: TextStyle(color: Colors.purple, fontSize: 30),
                          children: [
                            TextSpan(
                              text: "'ya hoşgeldiniz Kullanıcı_adı",
                              style: TextStyle(color: Colors.black),
                            )
                          ]))),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth / 20),
              child: const Text(
                "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!",
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(screenWidth / 20),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth / 80),
                    child: Column(
                      children: [
                        SizedBox(
                            width: screenWidth / 3,
                            child:
                                Image.asset("assets/images/istkodluyor.png")),
                        const Text(
                          " Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.",
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          "  Aradığın \"İş\" Burada ",
                        ),
                        Wrap(
                          children: [
                            TextButton(
                                onPressed: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //  builder: (ctx) =>
                                  //   const ApplicationCard()));
                                },
                                child: const Text("Başvurularım")),
                            TextButton(
                                onPressed: () {},
                                child: const Text("Eğitimlerim")),
                            TextButton(
                                onPressed: () {},
                                child: const Text("Duyuru ve Haberlerim")),
                            TextButton(
                                onPressed: () {},
                                child: const Text("Anketlerim"))
                          ],
                        ),
                        SizedBox(width: screenWidth / 0.20, child: ACard()),
                        //  SizedBox(width: screenWidth / 0.20, child: TrainingsCard()),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
