import 'package:flutter/material.dart';

class TrainingsCard extends StatelessWidget {
  const TrainingsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Image.asset("assets/images.istkodluyor.png"),
                  const Text(
                    "Dr. Ecmel Ayral'ın Hoşgeldin Mesajı",
                    style: TextStyle(color: Colors.black),
                  ),
                  const Text(
                    "21 Eylül 2023 15:20",
                    style: TextStyle(color: Colors.black),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Eğitime Git"))
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
              color: Colors.white,
              elevation: 10, // Card'a eklenen gölgenin yüksekliği
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Image.asset("assets/images.istkodluyor.png"),
                    const Text("Dr. Ecmel Ayral'ın Hoşgeldin Mesajı"),
                    const Text("Dr. Ecmel Ayral'ın Hoşgeldin Mesajı"),
                    ElevatedButton(
                      onPressed: () {
                        // Butona tıklandığında yapılacak işlemler
                      },
                      child: const Text("Eğitime Git"),
                    )
                  ],
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  //   Image.asset("assets/images.istkodluyor.png"),
                  const Text("Dr. Ecmel Ayral'ın Hoşgeldin Mesajı"),
                  const Text("Dr. Ecmel Ayral'ın Hoşgeldin Mesajı"),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Eğitime Git"))
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  //   Image.asset("assets/images.istkodluyor.png"),
                  const Text("Dr. Ecmel Ayral'ın Hoşgeldin Mesajı"),
                  const Text("Dr. Ecmel Ayral'ın Hoşgeldin Mesajı"),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Eğitime Git"))
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 60.0,
              height: 60.0,
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
