import 'package:flutter/material.dart';
import 'package:tobetoapp/models/training.dart';

class TrainingsCard extends StatelessWidget {
  const TrainingsCard({Key? key, required this.training}) : super(key: key);
  final Training training;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;
    return SizedBox(
      width: screenWidth,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Card(
              elevation: 10,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ), // Yuvarlanan köşe
                    child: Image.asset(
                      training.imagePath,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    training.title,
                  ),
                  Text(
                    training.time,
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Eğitime Git"))
                ],
              ),
            ),
          ),
          /*
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Gölge rengi
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
            ),
          ),
          const Text("Daha Fazla Göster"),
          */
        ],
      ),
    );
  }
}
