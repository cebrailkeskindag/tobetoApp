import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tobetoapp/datas/datas.dart';
import 'package:tobetoapp/models/profile_edit.dart';
import 'package:tobetoapp/screen/homepage_screen.dart';

class PersonalEdit extends StatefulWidget {
  const PersonalEdit({Key? key}) : super(key: key);

  @override
  _PersonalEditState createState() => _PersonalEditState();
}

final firebaseStorageInstance = FirebaseStorage.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseFirestore = FirebaseFirestore.instance;
final user = firebaseAuthInstance.currentUser;

class _PersonalEditState extends State<PersonalEdit> {
  File? _pickedFile;

  DateTime? selectedDate;
  Province? selectedprovince;
  String _imageUrl = "";
  String _name = "";
  String _surname = "";
  String _phoneNumber = "";
  DateTime? _birthDate;
  String _tc = "";
  String _email = "";
  String _country = "";
  String _city = "";
  String _district = "";
  String _street = "";
  String _aboutMe = "";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _tcController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _aboutMeController = TextEditingController();

  @override
  void initState() {
    _getUserImage();
    super.initState();
  }

  void _getUserImage() async {
    print("GetUserImage");
    final user = firebaseAuthInstance.currentUser;
    final document = firebaseFireStore.collection("users").doc(user!.uid);
    final documentSnapshot = await document.get();
    print("documentSnapshot");
    setState(() {
      if (documentSnapshot.get("imageUrl") != null) {
        _imageUrl = documentSnapshot.get("imageUrl");
      }
    });
  }

  void _pickImage() async {
    final image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 150);

    if (image != null) {
      setState(() {
        _pickedFile = File(image.path);
      });
    }
  }

  void _upload() async {
    final user = firebaseAuthInstance.currentUser;
    final storageRef =
        firebaseStorageInstance.ref().child("images").child("${user!.uid}.jpg");

    await storageRef.putFile(_pickedFile!);

    final url = await storageRef.getDownloadURL();
    print(url);

    final document = firebaseFireStore.collection("users").doc(user.uid);
    await document.update({'imageUrl': url});

    setState(() {
      _imageUrl = url;
    });
  }

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
              if (_imageUrl.isNotEmpty && _pickedFile == null)
                CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  foregroundImage: NetworkImage(_imageUrl),
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
                              onPressed: () {
                                _pickImage();
                              },
                              icon: const Icon(Icons.create),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              if (_pickedFile != null)
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      foregroundImage: FileImage(_pickedFile!),
                      maxRadius: 80,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.redAccent,
                            maxRadius: 20,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _pickedFile =
                                      null; // Seçilen resmi null olarak ayarla
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 50), // Boşluk ekleyebilirsiniz
                          CircleAvatar(
                            maxRadius: 20,
                            child: IconButton(
                              onPressed: () {
                                _pickImage(); // Edit iconuna tıklandığında yeni resim seçme işlemi
                              },
                              icon: const Icon(Icons.create),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => _name = value,
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: "Adınız*",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => _surname = value,
                controller: _surnameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: "Soyadınız*",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => _phoneNumber = value,
                controller: _phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
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
                      : "Doğum Tarihiniz",
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
                          _birthDate = picked;
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
                onChanged: (value) => _tc = value,
                controller: _tcController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "TC Kimlik No*",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => _email = value,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "E-posta*",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => _country = value,
                controller: _countryController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
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
                      _city = selectedprovince!.city;
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
                onChanged: (value) => _district = value,
                controller: _districtController,
                keyboardType: TextInputType.name,
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
              TextField(
                onChanged: (value) => _street = value,
                controller: _streetController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: "Mahalle / Sokak",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => _aboutMe = value,
                controller: _aboutMeController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: "Hakkımda",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    _upload();
                    firebaseFirestore
                        .collection('users')
                        .doc(user!.uid)
                        .collection('profile')
                        .doc('personal')
                        .set({
                      "uid": user?.uid,
                      "imageUrl": _imageUrl,
                      "name": _name,
                      "surname": _surname,
                      "phoneNumber": _phoneNumber,
                      "birthDate": _birthDate,
                      "tc": _tc,
                      'email': _email,
                      "country": _country,
                      "city": _city,
                      "district": _district,
                      "street": _street,
                      "aboutMe": _aboutMe,
                    });
                  },
                  child: const Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
}
