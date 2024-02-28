import 'package:flutter/material.dart';

class CustomBottomDescription extends StatelessWidget {
  const CustomBottomDescription({
    Key? key,
    required this.phoneNumber,
    required this.birthDate,
    required this.email,
  }) : super(key: key);

  final String phoneNumber;
  final String birthDate;
  final String email;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              birthDate.isEmpty?
              'Doğum Tarihi': birthDate,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            Text(
              phoneNumber.isEmpty?
              'Telefon Numarası':phoneNumber,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          email.isEmpty?
          'Email Address':email,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
