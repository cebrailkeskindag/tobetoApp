import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
                Text("Duyuru"),
                Text("İstanbul Kodluyor"),
              ],
            ),
            Row(
              children: [
                Icon(Icons.calendar_month_outlined),
                Text("07.12.2023"),
                TextButton(onPressed: () {}, child: Text("Devamını Oku"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
