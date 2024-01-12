import 'package:flutter/material.dart';

class PerfectionEdit extends StatefulWidget {
  const PerfectionEdit({Key? key}) : super(key: key);

  @override
  _PerfectionEditState createState() => _PerfectionEditState();
}

class _PerfectionEditState extends State<PerfectionEdit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    labelText: "Yetkinlik*",
                    hintText: "Seçiniz",
                    hintStyle: const TextStyle(fontFamily: "Poppins"),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_down)),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: const Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
}
