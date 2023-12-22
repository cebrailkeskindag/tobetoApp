import 'package:flutter/material.dart';

class ACard extends StatelessWidget {
  const ACard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.green),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "İstanbul Kodluyor \nBilgilendirme",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0),
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    constraints: const BoxConstraints(
                      maxWidth: 100,
                      maxHeight: 20,
                    ),
                    color: const Color.fromARGB(255, 22, 62, 23),
                    child: const Text(
                      '  Kabul Edildi',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.check,
                  size: 20,
                ),
                Text(
                  "İstanbul Kodluyor Başvuru Formu \nOnaylandı.",
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.check,
                  size: 20,
                ),
                Text(
                  "İstanbul Kodluyor Belge Yükleme \nFormu Onaylandı.",
                  style: TextStyle(fontSize: 13),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
