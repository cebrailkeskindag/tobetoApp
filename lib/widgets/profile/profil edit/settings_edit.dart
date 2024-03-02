import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/blocs/auth_bloc/auth_event.dart';
import 'package:tobetoapp/screen/loginpage.dart';

class SettingsEdit extends StatefulWidget {
  const SettingsEdit({Key? key}) : super(key: key);

  @override
  _SettingsEditState createState() => _SettingsEditState();
}

class _SettingsEditState extends State<SettingsEdit> {
  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Parola sıfırlama maili mail adresinize gönderildi.")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Parola sıfırlama sırasında bir hata oluştu.}")));
    }
  }

  Future<void> deleteUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.delete();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Hesabınız silindi.")));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const LoginPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Hesap silme sırasında bir hata oluştu.}")));
      }
    }
  }

  final TextEditingController _emailController = TextEditingController();
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
              const TextField(
                decoration: InputDecoration(
                    labelText: "Eski şifre*",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Yeni Şifre*",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Yeni Şifre Tekrar*",
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30)),
                          child: Container(
                            height: 150,
                            color: Theme.of(context).colorScheme.background,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                        labelText: 'E-posta Adresi'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      resetPassword(_emailController.text);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Şifremi Sıfırla'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text("Şifre Değiştir")),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Hesabınızı silmek istiyor musunuz?'),
                        action: SnackBarAction(
                          label: 'Hesabımı Sil',
                          onPressed: () {
                            deleteUser();
                          },
                        ),
                        duration: Duration(
                            seconds: 3), // SnackBar'ın ekranda kalma süresi
                      ),
                    );
                  },
                  child: const Text("Üyeliği Sonlandır")),
            ],
          ),
        ),
      ),
    );
  }
}
