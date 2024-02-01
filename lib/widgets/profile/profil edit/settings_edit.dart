import 'package:flutter/material.dart';

class SettingsEdit extends StatefulWidget {
  const SettingsEdit({Key? key}) : super(key: key);

  @override
  _SettingsEditState createState() => _SettingsEditState();
}

class _SettingsEditState extends State<SettingsEdit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                    labelText: "Eski şifre*",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Yeni Şifre*",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Yeni Şifre Tekrar*",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Şifre Değiştir")),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {},
                  child: const Text("Üyeliği Sonlandır")),
            ],
          ),
        ),
      ),
    );
  }
}
