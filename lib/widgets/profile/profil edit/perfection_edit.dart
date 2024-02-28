import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/datas/datas.dart';
import 'package:tobetoapp/models/profile_edit.dart';

class PerfectionEdit extends StatefulWidget {
  const PerfectionEdit({Key? key}) : super(key: key);

  @override
  _PerfectionEditState createState() => _PerfectionEditState();
}

class _PerfectionEditState extends State<PerfectionEdit> {
  final firebaseAuthInstance = FirebaseAuth.instance;

  final firebaseFireStore = FirebaseFirestore.instance;
  DateTime? date;
  void _submitPerfection() async {
    final user = firebaseAuthInstance.currentUser;
    final document = firebaseFireStore.collection("users").doc(user!.uid);
    //final documentSnapshot = await document.get();
    // var perfectionCollectionRef = document.collection('profile').doc("perfections");
    //var querySnapshot = await perfectionCollectionRef.get();
    date = DateTime.now();
    try {
      document.collection("perfections").doc().set({
        'perfection': selectedperfection?.compet,
        'date': date,
      });
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

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
              ElevatedButton(onPressed: () {
                print(selectedperfection?.compet);
                _submitPerfection();
                }, child: const Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
}
