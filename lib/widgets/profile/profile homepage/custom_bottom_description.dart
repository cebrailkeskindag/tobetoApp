import 'package:flutter/material.dart';

class CustomBottomDescription extends StatelessWidget {
  const CustomBottomDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '10.10.2023',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            Spacer(),
            Text(
              'Telefon Numarası',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          'Email Address',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
