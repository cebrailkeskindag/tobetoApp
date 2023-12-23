import 'package:flutter/material.dart';
import 'package:tobetoapp/widgets/a_card.dart';
import 'package:tobetoapp/widgets/category_card.dart';

import 'package:tobetoapp/widgets/drawer.dart';
import 'package:tobetoapp/widgets/exam_card.dart';


import '../theme/app_color.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    Color tColor = currentBrightness == Brightness.light
        ? AppColorLight.textColor
        : AppColorDark.textColor;
         String istkodluyor = currentBrightness == Brightness.light
        ? 'assets/images/istkodluyor.png'
        : 'assets/images/istkodluyor_dark.png';
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;

    // Ekran yüksekliği
    //double screenHeight = mediaQuery.size.height;
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
                          style: const TextStyle(color: Colors.purple, fontSize: 30),
                          children: [
                            TextSpan(
                              text: "'ya hoşgeldiniz Kullanıcı_adı",
                              style: TextStyle(color: tColor),
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
                  color: Theme.of(context).colorScheme.background,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth / 80),
                    child: Column(
                      children: [
                        SizedBox(
                            width: screenWidth / 3,
                            child:
                                Image.asset(istkodluyor)),
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
                         // SizedBox(width: screenWidth / 0.20, child: TrainingsCard()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
           SizedBox(width: screenWidth /0.20,child: ExamCard()),
            SizedBox(width: screenWidth /0.20,child: CategoryCard())
          ],
        ),
      ),
    );
  }
}
