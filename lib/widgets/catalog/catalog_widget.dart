import 'package:flutter/material.dart';
import 'package:tobetoapp/models/catalog_model.dart';

class CatalogWidget extends StatelessWidget {
  const CatalogWidget({Key? key, required this.catalogModel}) : super(key: key);
  final CatalogModel catalogModel;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          // Arka plan resmi
          Image.network(
            catalogModel.imagePath,
            fit: BoxFit.cover,
          ),

          // Metin ve düğmeler
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Container(
              width: screenWidth,
              color: Colors.black.withOpacity(0.5),
              //color: Colors.black.withOpacity(0.5),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        Text(
                          catalogModel.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.access_time,
                          color: Colors.white,
                        ),
                        Text(
                          catalogModel.time,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Flexible(
                            child: Text(
                              catalogModel.title,
                              softWrap: true,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 20.0,
            right: 20.0,
            child: IconButton(
              onPressed: () {
                // Düğme tıklandığında yapılacak işlemler
              },
              icon: const Icon(Icons.play_circle),
              iconSize: 50,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
