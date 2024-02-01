import 'package:flutter/material.dart';

class CertificateEdit extends StatefulWidget {
  const CertificateEdit({Key? key}) : super(key: key);

  @override
  _CertificateEditState createState() => _CertificateEditState();
}

class _CertificateEditState extends State<CertificateEdit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sertifikalarım",
              style: TextStyle(color: Colors.deepPurple, fontSize: 26),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {},
              child: Container(
                color: Colors.grey.shade100,
                height: 200,
                width: 350,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.file_upload_outlined),
                    Text("Dosya Yükle")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
