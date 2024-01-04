import 'package:flutter/material.dart';

class TrainingsCard extends StatelessWidget {
  const TrainingsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
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
                    "assets/images/ecmal.jpg",
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const Text(
                  "Dr. Ecmel Ayral'dan Hoşgeldin Mesajı",
                ),
                const Text(
                  "21 Eylül 2023 15:20",
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Eğitime Git"))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Card(
              elevation: 10, // Card'a eklenen gölgenin yüksekliği
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ), // Yuvarlanan köşe
                    child: Image.asset(
                      "assets/images/istkod_egitim.jpg",
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text("Eğitimlere Nasıl Katılırım?"),
                  const Text("8 Eylül 2023 17:06"),
                  ElevatedButton(
                    onPressed: () {
                      // Butona tıklandığında yapılacak işlemler
                    },
                    child: const Text("Eğitime Git"),
                  )
                ],
              )),
        ),
        const SizedBox(height: 20),
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
        const Text("Daha Fazla Göster")
      ],
    );
  }
}
