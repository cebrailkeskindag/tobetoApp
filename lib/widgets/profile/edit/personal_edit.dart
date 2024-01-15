import 'package:flutter/material.dart';

class PersonalEdit extends StatefulWidget {
  const PersonalEdit({Key? key}) : super(key: key);

  @override
  _PersonalEditState createState() => _PersonalEditState();
}

class _PersonalEditState extends State<PersonalEdit> {
  DateTime? selectedDate;
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
              TextField(
                decoration: InputDecoration(
                    labelText: "Telefon Numaranız*",
                    hintStyle: const TextStyle(fontFamily: "Poppins"),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Doğum Tarihiniz",
                  hintText: selectedDate != null
                      ? "${selectedDate!.toLocal().day}/${selectedDate!.toLocal().month}/${selectedDate!.toLocal().year}"
                      : "Tarih Seçin",
                  hintStyle: const TextStyle(fontFamily: "Poppins"),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
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
                    icon: const Icon(Icons.calendar_today),
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
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    labelText: "İl*",
                    hintStyle: const TextStyle(fontFamily: "Poppins"),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_down)),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
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
