import 'package:flutter/material.dart';

import 'package:tobetoapp/models/perfection.dart';

class PerfectionCard extends StatelessWidget {
  const PerfectionCard({Key? key, required this.perfection}) : super(key: key);
  final PerfectionModel perfection;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;

    // Ekran yüksekliği
    //double screenHeight = mediaQuery.size.height;
    return Padding(
      padding: EdgeInsets.all(screenWidth / 30),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              SizedBox(
                height: 80,
                child: AspectRatio(
                  aspectRatio: 8 / 9,
                  child: Card(
                    elevation: 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(
                                  softWrap: true,
                                  perfection.perfection,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900)),
                            ),
                           
                          ],
                        ),
                        
                        
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
