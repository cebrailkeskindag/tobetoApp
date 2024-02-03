import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/datas/datas.dart';
import 'package:tobetoapp/models/profile_edit.dart';

class EducationEdit extends StatefulWidget {
  const EducationEdit({Key? key}) : super(key: key);

  @override
  _EducationEditState createState() => _EducationEditState();
}

class _EducationEditState extends State<EducationEdit> {
  DateTime? selectedDate;
  DateTime? selectedendDate;
  Education? selectededucation;
  bool isChecked = false;
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
              DropdownButtonFormField2<Education>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Eğitim Durumu*",
                  hintStyle: const TextStyle(fontFamily: "Poppins"),
                ),
                value: selectededucation,
                onChanged: (Education? education) {
                  if (education != null) {
                    setState(() {
                      selectededucation = education;
                    });
                  }
                },
                items: educationLevels.map((Education education) {
                  return DropdownMenuItem<Education>(
                    enabled: true,
                    value: education,
                    child: Text(
                      education.eduLevel,
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
              const TextField(
                decoration: InputDecoration(
                    labelText: "Üniversite*",
                    hintText: "Kampüs 365",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Bölüm*",
                    hintText: "Yazılım Mühendisliği",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  // labelText: "Doğum Tarihiniz",
                  hintText: selectedDate != null
                      ? "${selectedDate!.toLocal().year}"
                      : "Başlangıç Yılı",
                  hintStyle: const TextStyle(fontFamily: "Poppins"),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        builder: (context, child) => Theme(
                            data: ThemeData.light().copyWith(
                              primaryColor: Colors.white,
                            ),
                            child: child!),
                        context: context,
                        initialDate: selectedDate ?? DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                    icon: const Icon(Icons.calendar_month),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  // labelText: "Doğum Tarihiniz",
                  hintText: selectedendDate != null
                      ? "${selectedendDate!.toLocal().year}"
                      : "Mezuniyet Yılı",
                  hintStyle: const TextStyle(fontFamily: "Poppins"),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        builder: (context, child) => Theme(
                            data: ThemeData.light().copyWith(
                              primaryColor: Colors.white,
                            ),
                            child: child!),
                        context: context,
                        initialDate: selectedendDate ?? DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setState(() {
                          selectedendDate = picked;
                        });
                      }
                    },
                    icon: const Icon(Icons.calendar_month),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    checkColor: Colors.white,
                  ),
                  const Text("Devam Ediyorum")
                ],
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
