import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Adjust the value as needed
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 6,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16.0, top: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 200,
                    child: Text(
                      "İstanbul Kodluyor Bilgilendirme",
                      softWrap: true,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
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
                      color: Color.fromRGBO(
                        27,
                        227,
                        240,
                        1,
                      ),
                      child: const Text(
                        '  Kabul Edildi',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.check,
                      size: 20,
                    ),
                  ),
                  Text(
                    "İstanbul Kodluyor Başvuru Formu \nOnaylandı.",
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.check,
                      size: 20,
                    ),
                  ),
                  Text(
                    "İstanbul Kodluyor Belge Yükleme \nFormu Onaylandı.",
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
