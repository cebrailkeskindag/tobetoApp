import 'package:flutter/material.dart';
import 'package:tobetoapp/models/news.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.news}) : super(key: key);
  final News news;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: screenWidth,
        child: Card(
          elevation: 5,
          shape: Border(
              left: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 8,
          )),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 12.0, top: 8.0, bottom: 8.0, right: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Duyuru",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "İstanbul Kodluyor",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      news.title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.calendar_month_outlined),
                    Text(
                      news.newsDate,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {}, child: const Text("Devamını Oku"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
