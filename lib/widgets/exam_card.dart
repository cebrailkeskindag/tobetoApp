import 'package:flutter/material.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;

    // Ekran yüksekliği
    //double screenHeight = mediaQuery.size.height;
    return Padding(
      padding: EdgeInsets.all(screenWidth / 20),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Sınavlarım",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Container(
                height: 200,
                child: const AspectRatio(
                  aspectRatio: 8 / 9,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(
                                  softWrap: true,
                                  "Herkes için Kodlama 2B Değerlendirme Sınavı",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900)),
                            ),
                            Icon(
                              Icons.check_box,
                              color: Colors.purple,
                            )
                          ],
                        ),
                        Text(
                          "Herkes için Kodlama-2B",
                          style: TextStyle(fontSize: 11),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: Row(
                            children: [
                              Icon(
                                Icons.timer_outlined,
                                color: Colors.purple,
                              ),
                              Text(
                                " 45 Dakika",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )
                            ],
                          ),
                        )
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
}
