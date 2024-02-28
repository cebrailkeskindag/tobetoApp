import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/datas/datas.dart';
import 'package:tobetoapp/models/profile_edit.dart';

class ExperienceEdit extends StatefulWidget {
  const ExperienceEdit({Key? key}) : super(key: key);

  @override
  _ExperienceEditState createState() => _ExperienceEditState();
}

class _ExperienceEditState extends State<ExperienceEdit> {
  bool isChecked = false;
  Province? selectedprovince;
  DateTime? selectedDate;
  DateTime? selectedendDate;

  @override
  Widget build(BuildContext context) {

    MediaQueryData mediaQuery = MediaQuery.of(context);

    double screenHeight = mediaQuery.size.height;

    return SizedBox(
      width: double.infinity,
      height: screenHeight * 0.8,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                    labelText: "Kurum Adı*",
                    hintText: "Kampüs 365",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Pozisyon*",
                    hintText: "Mobile Developer",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Sektör*",
                    hintText: "Yazılım",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
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
                  hintStyle: TextStyle(
                    fontFamily: "Poppins",
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
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
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
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
                  // labelText: "Doğum Tarihiniz",
                  hintText: selectedDate != null
                      ? "${selectedDate!.toLocal().day.toString().padLeft(2, '0')}/${selectedDate!.toLocal().month.toString().padLeft(2, '0')}/${selectedDate!.toLocal().year}"
                      : "İş Başlangıcı",
                  hintStyle: TextStyle(
                      fontFamily: "Poppins",
                      color: Theme.of(context).colorScheme.surface),
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
                      ? "${selectedendDate!.toLocal().day.toString().padLeft(2, '0')}/${selectedendDate!.toLocal().month.toString().padLeft(2, '0')}/${selectedendDate!.toLocal().year}"
                      : "İş Bitişi",
                  hintStyle: TextStyle(
                    fontFamily: "Poppins",
                    color: Theme.of(context).colorScheme.surface,
                  ),
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
                  const Text("Çalışmaya Devam Ediyorum")
                ],
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    labelText: "İş Açıklaması",
                    hintText: "Yaptığınız İşi Özetleyin",
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
