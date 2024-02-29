import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tobetoapp/models/edu.dart';
import 'package:tobetoapp/screen/edu_video_player.dart';

class TrainingsCard extends StatelessWidget {
  const TrainingsCard({Key? key, required this.edu}) : super(key: key);
  final Edu edu;

  @override
  Widget build(BuildContext context) {
    String formatTimestamp(Timestamp timestamp, String format) {
      DateTime dateTime = timestamp.toDate();
      return DateFormat(format).format(dateTime);
    }

    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    String formattedDate = formatTimestamp(edu.date, 'yyyy-MM-dd – kk:mm');
    Uri videoUri = Uri.parse(
        edu.videoUrl);
    return SizedBox(
      width: screenWidth * 0.95,
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
                    child: Image.network(
                      edu.imageUrl,
                      width: screenWidth * 0.9,
                      height: 180,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        }
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Text('Resim yüklenirken bir hata oluştu');
                      },
                    ),
                  ),
                  Text(
                    edu.title,
                  ),
                  Text(
                    formattedDate,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => EduVideoPlayer(
                                  videoUrl: videoUri,edu:edu
                                )));
                      },
                      child: const Text("Eğitime Git"))
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
