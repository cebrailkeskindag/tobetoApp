import 'package:cloud_firestore/cloud_firestore.dart';

void addDataToFirestore(String name ,String username, int phone, int birthdate, int tc, String email,String country,String city, String district) async {
  try {
    // Firestore referansını al
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Veriyi Firestore'a ekle
    await users.add({
      'username': username,
      'email': email,

      // Diğer alanları da ekleyebilirsiniz.
    });

    print('Veri başarıyla Firestore a eklendi!');
  } catch (e) {
    print('Hata oluştu: $e');
  }
}