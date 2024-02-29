import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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
  String _birthDateString = "";
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

  String formatTimestamp(Timestamp timestamp, String format) {
    DateTime dateTime = timestamp.toDate();
    return DateFormat(format).format(dateTime);
  }

  void _getUserImage() async {
    print("GetUserImage");
    final user = firebaseAuthInstance.currentUser;
    final document = firebaseFireStore.collection("users").doc(user!.uid);
    final documentSnapshot = await document.get();
    var profileCollectionRef = document.collection('profile').doc("personal");
    var querySnapshot = await profileCollectionRef.get();
    if (querySnapshot.exists) {
      setState(() {
        if (querySnapshot.get("imageUrl") != null) {
          _imageUrl = querySnapshot.get("imageUrl");
        }
        if (querySnapshot.get("name") != null) {
          _name = querySnapshot.get("name");
        }
        if (querySnapshot.get("surname") != null) {
          _surname = querySnapshot.get("surname");
        }
        if (querySnapshot.get("phoneNumber") != null) {
          _phoneNumber = querySnapshot.get("phoneNumber");
        }
        if (querySnapshot.get("birthDate") != null) {
          _birthDateString = formatTimestamp(
              querySnapshot.get("birthDate"), 'yyyy-MM-dd – kk:mm');
        }

        if (querySnapshot.get("tc") != null) {
          _tc = querySnapshot.get("tc");
        }

        if (querySnapshot.get("email") != null) {
          _email = querySnapshot.get("email");
        }

        if (querySnapshot.get("country") != null) {
          _country = querySnapshot.get("country");
        }
        if (querySnapshot.get("city") != null) {
          _city = querySnapshot.get("city");
        }
        if (querySnapshot.get("district") != null) {
          _district = querySnapshot.get("district");
        }
        if (querySnapshot.get("street") != null) {
          _street = querySnapshot.get("street");
        }
        if (querySnapshot.get("aboutMe") != null) {
          _aboutMe = querySnapshot.get("aboutMe");
        }
      });
    }
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
              if (_pickedFile == null)
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
                          const SizedBox(width: 50), // Boşluk ekleyebilirsiniz
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
                decoration: InputDecoration(
                    labelText: _name.isEmpty ? "Adınız*" : _name,
                    hintStyle: const TextStyle(fontFamily: "Poppins"),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => _surname = value,
                controller: _surnameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: _surname.isEmpty ? "Soyadınız*" : _surname,
                    hintStyle: const TextStyle(fontFamily: "Poppins"),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => _phoneNumber = value,
                controller: _phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: _phoneNumber.isEmpty
                        ? "Telefon Numaranız*"
                        : _phoneNumber,
                    hintStyle: const TextStyle(fontFamily: "Poppins"),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  // labelText: "Doğum Tarihiniz",
                  hintText: _birthDateString.isEmpty
                      ? selectedDate != null
                          ? "${selectedDate!.toLocal().day.toString().padLeft(2, '0')}/${selectedDate!.toLocal().month.toString().padLeft(2, '0')}/${selectedDate!.toLocal().year}"
                          : "Doğum Tarihiniz"
                      : _birthDateString,
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
                          _birthDateString =
                              "${selectedDate!.toLocal().day.toString().padLeft(2, '0')}/${selectedDate!.toLocal().month.toString().padLeft(2, '0')}/${selectedDate!.toLocal().year}";
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
                decoration: InputDecoration(
                    labelText: _tc.isEmpty ? "TC Kimlik No*" : _tc,
                    hintStyle: const TextStyle(fontFamily: "Poppins"),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => _email = value,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: _email.isEmpty ? "E-posta*" : _email,
                    hintStyle: const TextStyle(fontFamily: "Poppins"),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => _country = value,
                controller: _countryController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: _country.isEmpty ? "Ülke*" : _country,
                  hintStyle: const TextStyle(fontFamily: "Poppins"),
                  border: const OutlineInputBorder(
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
                  labelText: _city.isEmpty ? "Şehir Seçiniz*" : _city,
                  //hintText: "İstanbul",
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
                    labelText: _district.isEmpty ? "İlçe*" : _district,
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
                decoration: InputDecoration(
                    labelText: _street.isEmpty ? "Mahalle / Sokak" : _street,
                    hintStyle: const TextStyle(fontFamily: "Poppins"),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => _aboutMe = value,
                controller: _aboutMeController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: _aboutMe.isEmpty ? "Hakkımda" : _aboutMe,
                    hintStyle: const TextStyle(fontFamily: "Poppins"),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (_name.isNotEmpty &&
                        _surname.isNotEmpty &&
                        _phoneNumber.isNotEmpty &&
                        _birthDateString.isNotEmpty &&
                        _tc.isNotEmpty &&
                        _email.isNotEmpty &&
                        _country.isNotEmpty &&
                        _city.isNotEmpty &&
                        _district.isNotEmpty) {
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
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Lütfen eksik alanları giriniz")));
                    }
                  },
                  child: const Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
}
