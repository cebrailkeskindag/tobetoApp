import 'package:flutter/material.dart';

class NewsContent extends StatefulWidget {
  NewsContent({Key? key, required this.content, required this.title})
      : super(key: key);
  final String content;
  final String title;
  @override
  _NewsContentState createState() => _NewsContentState();
}

class _NewsContentState extends State<NewsContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        shape: const RoundedRectangleBorder(
          //ovalleştirdi
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(60),
              bottomLeft: Radius.circular(60)),
        ),
        elevation: 10, //gölge effekti
        backgroundColor: Colors.purple[200], //arkaplan rengi
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.content,
                softWrap: true,
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
