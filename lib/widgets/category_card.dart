import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;

    // Ekran yüksekliği
    //double screenHeight = mediaQuery.size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.blue.shade900,
                Colors.purple,
                Colors.white
              ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
              width: screenWidth,
              height: 180,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Profilini Oluştur",
                      style: TextStyle(color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Başla"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 34),
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
                  gradient: LinearGradient(colors: [
                Colors.blue.shade900,
                Colors.purple,
                Colors.white
              ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
              width: screenWidth,
              height: 180,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Kendini Değerlendir",
                      style: TextStyle(color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Başla"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 34),
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
                  gradient: LinearGradient(colors: [
                Colors.blue.shade900,
                Colors.purple,
                Colors.white
              ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
              width: screenWidth,
              height: 180,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Öğrenmeye Başla",
                      style: TextStyle(color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Başla"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 34),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
