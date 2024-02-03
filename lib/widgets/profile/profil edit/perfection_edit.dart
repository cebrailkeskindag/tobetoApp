import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/datas/datas.dart';
import 'package:tobetoapp/models/profile_edit.dart';

class PerfectionEdit extends StatefulWidget {
  const PerfectionEdit({Key? key}) : super(key: key);

  @override
  _PerfectionEditState createState() => _PerfectionEditState();
}

class _PerfectionEditState extends State<PerfectionEdit> {
  Perfection? selectedperfection;
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
              DropdownButtonFormField2<Perfection>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Yetkinlik",
                  hintStyle: const TextStyle(fontFamily: "Poppins"),
                ),
                value: selectedperfection,
                onChanged: (Perfection? compet) {
                  if (compet != null) {
                    setState(() {
                      selectedperfection = compet;
                    });
                  }
                },
                items: compets.map((Perfection compet) {
                  return DropdownMenuItem<Perfection>(
                    enabled: true,
                    value: compet,
                    child: Text(
                      compet.compet,
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
