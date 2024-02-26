import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Card(
        elevation: 5,
        shape: Border(
            left: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
          width: 8,
        )),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 8.0, bottom: 8.0),
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
                      color: const Color.fromARGB(255, 22, 62, 23),
                      child: const Text(
                        '  Kabul Edildi',
                        style: TextStyle(fontSize: 12, color: Colors.white),
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
      ),
    );
  }
}
