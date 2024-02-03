import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/datas/datas.dart';
import 'package:tobetoapp/models/profile_edit.dart';

class PersonalEdit extends StatefulWidget {
  const PersonalEdit({Key? key}) : super(key: key);

  @override
  _PersonalEditState createState() => _PersonalEditState();
}

class _PersonalEditState extends State<PersonalEdit> {
  DateTime? selectedDate;
  Province? selectedprovince;
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
              CircleAvatar(
                backgroundColor: Colors.blueGrey,
                maxRadius: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.redAccent,
                          maxRadius: 20,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          maxRadius: 20,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.create),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Adınız*",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Soyadınız*",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Telefon Numaranız*",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  // labelText: "Doğum Tarihiniz",
                  hintText: selectedDate != null
                      ? "${selectedDate!.toLocal().day.toString().padLeft(2, '0')}/${selectedDate!.toLocal().month.toString().padLeft(2, '0')}/${selectedDate!.toLocal().year}"
                      : "Tarih",
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
              const TextField(
                decoration: InputDecoration(
                    labelText: "TC Kimlik No*",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    labelText: "E-posta*",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Ülke*",
                  hintStyle: TextStyle(fontFamily: "Poppins"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField2<Province>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Şehir Seçiniz*",
                  hintText: "İstanbul",
                  hintStyle: const TextStyle(fontFamily: "Poppins"),
                ),
                value: selectedprovince,
                onChanged: (Province? province) {
                  if (province != null) {
                    setState(() {
                      selectedprovince = province;
                    });
                  }
                },
                items: provinces.map((Province province) {
                  return DropdownMenuItem<Province>(
                    enabled: true,
                    value: province,
                    child: Text(
                      province.city,
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
              TextField(
                decoration: InputDecoration(
                    labelText: "İlçe*",
                    hintStyle: const TextStyle(fontFamily: "Poppins"),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_down)),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Mahalle / Sokak",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Hakkımda",
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
