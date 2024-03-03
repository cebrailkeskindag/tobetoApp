import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key? key,
    required this.size,
    required this.percent,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final double percent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: size.height * 0.020,
        left: 10,
        child: InkWell(
          onTap: onTap,
          child: CircleAvatar(
            minRadius: 20,
            backgroundColor: Colors.purple,
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: percent < .56
                  ? Colors.white.withOpacity(1 - percent)
                  : Colors.white,
            ),
          ),
        ));
  }
}
