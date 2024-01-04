import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 20.0),
              child: Text(
                'Hakkımda',
                style: TextStyle(fontSize: 23),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                '''When a young boy disappears, his mother, a police chief, and his friend must confront terrifying forces in order to get him back.
                      ''',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 10),
              child: Text(
                'Yetkinlik Rozetlerim',
                style: TextStyle(fontSize: 23),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      8,
                      (index) => Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                height: size.height * 0.18,
                                width: size.width * 0.23,
                                image: AssetImage('assets/images/iconlogo.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ))),
            ),
            const SizedBox(
              height: 15,
            ),
            _Features(
              size: size,
              title: 'Yetkinliklerim',
              subtitle: '8 watched',
              colorline: Colors.red[300]!,
            ),
            _Features(
              size: size,
              title: 'Yabancı Dillerim',
              subtitle: '9 watched',
              colorline: Colors.red[300]!,
            ),
            _Features(
              size: size,
              title: 'Sertifikalarım',
              subtitle: '1 to air',
              colorline: Colors.grey[300]!,
            ),
            _Features(
              size: size,
              title: 'Medya Hesaplarım',
              subtitle: '7 to watch',
              colorline: Colors.grey[300]!,
            ),
          ],
        ));
  }
}

class _CustomIcon extends StatelessWidget {
  const _CustomIcon({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 45,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        )
      ],
    );
  }
}

class _Features extends StatelessWidget {
  const _Features({
    Key? key,
    required this.size,
    required this.title,
    required this.subtitle,
    required this.colorline,
  }) : super(key: key);

  final Size size;
  final String title;
  final String subtitle;
  final Color colorline;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: size.width,
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    height: 5,
                    color: colorline,
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.pending,
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }
}
