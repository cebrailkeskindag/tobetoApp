import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tobetoapp/models/catalog_model.dart';
import 'package:tobetoapp/models/modelcatolag.dart';
import 'package:tobetoapp/screen/catalog_vp.dart';
import 'package:tobetoapp/screen/edu_video_player.dart';

class CatalogWidget extends StatelessWidget {
  const CatalogWidget({Key? key, required this.catalogModel}) : super(key: key);
  final ModelCatalog catalogModel;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Uri videoUri = Uri.parse(catalogModel.videoUrl);
    String formatTimestamp(Timestamp timestamp, String format) {
      DateTime dateTime = timestamp.toDate();
      return DateFormat(format).format(dateTime);
    }

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) =>
                CatalogVp(videoUrl: videoUri, modelCatalog: catalogModel)));
      },
      child: Stack(
        children: [
          // Arka plan resmi
          Image.network(
            catalogModel.imageUrl,
            fit: BoxFit.cover,
            width: screenWidth,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        Text(
                          catalogModel.author,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.access_time,
                          color: Colors.white,
                        ),
                        Text(
                          formatTimestamp(
                              catalogModel.date, 'yyyy-MM-dd – kk:mm'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => CatalogVp(
                        videoUrl: videoUri, modelCatalog: catalogModel)));
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
