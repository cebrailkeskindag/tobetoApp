import 'package:flutter/material.dart';

class CoverPhoto extends StatelessWidget {
  const CoverPhoto({Key? key, required this.size, required this.imageUrl})
      : super(key: key);
  final String imageUrl;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      width: size.width * 0.25,
      height: size.height * 0.16,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: imageUrl.isEmpty
              ? Image.asset(
                  'assets/images/ic_user.png',
                  fit: BoxFit.fill,
                )
              : ClipOval(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                )),
    );
  }
}
