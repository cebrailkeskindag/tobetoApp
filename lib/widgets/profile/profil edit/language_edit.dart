import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/datas/datas.dart';
import 'package:tobetoapp/models/calendar_model.dart';

class LanguageEdit extends StatefulWidget {
  const LanguageEdit({Key? key}) : super(key: key);

  @override
  _LanguageEditState createState() => _LanguageEditState();
}

class _LanguageEditState extends State<LanguageEdit> {
  Language? selectedlang;
  Level? selectedlevel;
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
              DropdownButtonFormField2<Language>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Dil Seçiniz*",
                  hintStyle: const TextStyle(fontFamily: "Poppins"),
                ),
                value: selectedlang,
                onChanged: (Language? language) {
                  if (language != null) {
                    setState(() {
                      selectedlang = language;
                    });
                  }
                },
                items: language.map((Language language) {
                  return DropdownMenuItem<Language>(
                    enabled: true,
                    value: language,
                    child: Text(
                      language.dil,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                  );
                }).toList(),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                ),
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: 200,
                  width: 200,
                  direction: DropdownDirection.left,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField2<Level>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Seviye Seçiniz*",
                  hintStyle: const TextStyle(fontFamily: "Poppins"),
                ),
                value: selectedlevel,
                onChanged: (Level? level) {
                  if (level != null) {
                    setState(() {
                      selectedlevel = level;
                    });
                  }
                },
                items: level.map((Level level) {
                  return DropdownMenuItem<Level>(
                    enabled: true,
                    value: level,
                    child: Text(
                      level.level,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                  );
                }).toList(),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                ),
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: 200,
                  width: 200,
                  direction: DropdownDirection.left,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
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
