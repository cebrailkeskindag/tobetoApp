import 'package:flutter/material.dart';

import 'package:tobetoapp/widgets/homepage/drawer.dart';
import 'package:tobetoapp/widgets/evaluation/eva_item.dart';

class Evaluation extends StatelessWidget {
  const Evaluation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
 
    double screenWidth = mediaQuery.size.width;

    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;

    String tobetoAppbarLogo = currentBrightness == Brightness.light
        ? 'assets/images/tobeto_logo.png'
        : 'assets/images/tobeto_logo_d.png';

    return Scaffold(
      endDrawer: const DrawerMenu(),
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Image.asset(
          tobetoAppbarLogo,
          width: 150,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Yetkinliklerini  ücretsiz ölç, bilgilerini test et. ",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                        Colors.blue.shade900,
                        Colors.purple,
                        Colors.blueAccent
                      ],
                          transform: const GradientRotation(15),
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft)),
                  width: screenWidth,
                  height: 280,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Tobeto İşte Başarı Modeli ",
                          style: TextStyle(color: Colors.white),
                        ),
                        const Text(
                          "80 soru ile yetkinliklerini ölç, önerilen eğitimleri tamamla, rozetini kazan.",
                          style: TextStyle(color: Colors.white),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(300, 34),
                              backgroundColor:
                                  const Color.fromRGBO(103, 82, 195, 1)),
                          child: const Text(
                            "Başla",
                            style: TextStyle(
                                fontFamily: "Poppins", color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                        Colors.blue.shade900,
                        Colors.purple,
                        Colors.blueAccent
                      ],
                          transform: const GradientRotation(15),
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft)),
                  width: screenWidth,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Yazılımda Başarı Testi",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          "Çoktan seçmeli sorular ile teknik bilgini test et.",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 50,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const EvaItem(title: "Front End"),
            const EvaItem(title: "Full Stack"),
            const EvaItem(title: "Back End"),
            const EvaItem(title: "Microsoft SQL Server"),
            const EvaItem(title: "Masaüstü Programlama"),
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.purple],
                      transform: GradientRotation(15),
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft)),
              height: 200,
              width: 20,
              alignment: Alignment.center,
            ),
            const Text(
              "Aboneliğe özel",
              style: TextStyle(color: Colors.purple, fontSize: 25),
            ),
            const Text(
              "değerlendirme araçları için",
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                        Colors.blue.shade900,
                        Colors.purple,
                        Colors.blueAccent
                      ],
                          transform: const GradientRotation(15),
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft)),
                  width: screenWidth,
                  height: 200,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          " Kazanım Odaklı Testler ",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Dijital gelişim kategorisindeki eğitimlere başlamadan öncekonuyla ilgili bilgin ölçülür ve seviyene göre yönlendirilirsin.",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                        Colors.blue.shade900,
                        Colors.purple,
                        Colors.blueAccent
                      ],
                          transform: const GradientRotation(15),
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft)),
                  width: screenWidth,
                  height: 280,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Huawei Talent Interview Teknik Bilgi Sınavı* ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Sertifika alabilmen için, eğitim yolculuğunun sonunda teknik yetkinliklerin ve kod bilgin ölçülür. 4400+ soru | 30+ programlama dili 4 zorluk seviyesi",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w100, color: Colors.white),
                        ),
                        Text(
                            " *Türkiye Ar-Ge Merkezi tarafından tasarlanmıştır.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
