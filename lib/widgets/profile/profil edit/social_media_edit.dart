import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/datas/datas.dart';
import 'package:tobetoapp/models/profile_edit.dart';

class SocialMediaEdit extends StatefulWidget {
  const SocialMediaEdit({Key? key}) : super(key: key);

  @override
  _SocialMediaEditState createState() => _SocialMediaEditState();
}

class _SocialMediaEditState extends State<SocialMediaEdit> {
  SocialMedia? _selectedMedia;
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
              DropdownButtonFormField2<SocialMedia>(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                hint: const Text('Seçiniz'),
                value: _selectedMedia,
                onChanged: (SocialMedia? socialMedia) {
                  if (socialMedia != null) {
                    setState(() {
                      _selectedMedia = socialMedia;
                    });
                  }
                },
                items: socialmedias.map((SocialMedia socialMedia) {
                  return DropdownMenuItem<SocialMedia>(
                    value: socialMedia,
                    child: Text(socialMedia.name),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    hintText: "https://",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
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
