import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetoapp/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobetoapp/blocs/auth_bloc/auth_state.dart';
import 'package:tobetoapp/screen/homepage_screen.dart';
import 'package:tobetoapp/screen/loginpage.dart';
import 'package:tobetoapp/theme/app_color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _password2 = '';
  String _name = '';
  String _surname = '';
  bool _isAuth = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firebaseAuthInstance = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  void _register() async {
    if (_email == null ||
        _password == null ||
        _password2 == null ||
        _name == null ||
        _surname == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Lütfen eksik alanları giriniz")));
    } else {
      if (_password == _password2) {
        try {
          final userCredentials =
              await firebaseAuthInstance.createUserWithEmailAndPassword(
                  email: _email, password: _password);
          print(userCredentials);
          firebaseFirestore
              .collection("users")
              .doc(userCredentials.user!
                  .uid) // içerisine id aldığında o id'yi almadığına AUTO-ID kullanır.
              .set({
            "uid": userCredentials.user!.uid,
          });
          firebaseFirestore
              .collection('users')
              .doc(userCredentials.user!.uid)
              .collection('profile')
              .doc('personal')
              .set({
            "uid": userCredentials.user!.uid,
            "imageUrl": "",
            "name": _name,
            "surname": _surname,
            "phoneNumber": "",
            "birthDate": FieldValue.serverTimestamp(),
            "tc": "",
            'email': _email,
            "country": "",
            "city": "",
            "district": "",
            "street": "",
            "aboutMe": "",
          });
        } on FirebaseAuthException catch (error) {
          // Hata mesajı göster..
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error.message ?? "Kayıt başarısız.")));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Parola eşleşmiyor")));
      }
    }
  }

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    String imageName = currentBrightness == Brightness.light
        ? 'assets/images/tobeto_logo.png'
        : 'assets/images/tobeto_logo_d.png';
    String backgroundLogin = currentBrightness == Brightness.light
        ? "assets/images/deneme7.jpg"
        : 'assets/images/deneme7.jpg';
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16),
        backgroundColor: (AppColorDark.elevatedButtonColor),
        minimumSize: const Size(290, 40));
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomepageScreen()),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(backgroundLogin),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: SizedBox(
              child: SizedBox(
                width: 400,
                height: 600,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        child: Image.asset(imageName),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextField(
                            onChanged: (value) => _name = value,
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    Theme.of(context).colorScheme.background,
                                labelText: "Adınız",
                                hintStyle:
                                    const TextStyle(fontFamily: "Poppins"),
                                prefixIcon: const Icon(Icons.person),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextField(
                            onChanged: (value) => _surname = value,
                            controller: _surnameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    Theme.of(context).colorScheme.background,
                                labelText: "Soyadınız",
                                hintStyle:
                                    const TextStyle(fontFamily: "Poppins"),
                                prefixIcon: const Icon(Icons.person),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextField(
                            onChanged: (value) => _email = value,
                            controller: _usernameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    Theme.of(context).colorScheme.background,
                                labelText: "Email giriniz",
                                hintStyle:
                                    const TextStyle(fontFamily: "Poppins"),
                                prefixIcon: const Icon(Icons.person),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              onChanged: (value) => _password = value,
                              controller: _passwordController,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).colorScheme.background,
                                  labelText: "Parola giriniz",
                                  hintStyle:
                                      const TextStyle(fontFamily: "Poppins"),
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                    child: Icon(_isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)))),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              onChanged: (value) => _password2 = value,
                              controller: _passwordController2,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).colorScheme.background,
                                  labelText: "Parolayı tekrar giriniz",
                                  hintStyle:
                                      const TextStyle(fontFamily: "Poppins"),
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                    child: Icon(_isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)))),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: buttonStyle,
                        onPressed: () {
                          _register();
                        },
                        child: Text(
                          "KAYIT OL",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontFamily: "Poppins"),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Çizgi
                          Container(
                            height: 2.0,
                            width: 90.0,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                              colors: [
                                Colors.black26,
                                Colors.white,
                              ],
                            )),
                          ),
                          // Continue with metni
                          /* const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Or continue with',
                              style: TextStyle(
                                color: Color(0xFFB5B5B5),
                                fontSize: 11.25,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ))),
                      // Çizgi

                      Container(
                        height: 2.0,
                        width: 90.0,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black26,
                            Colors.white,
                          ],
                        )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 50,
                            height: 50,
                            decoration: ShapeDecoration(
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/gologo.png")),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0.30, color: Colors.white),
                                borderRadius: BorderRadius.circular(8.85),
                              ),
                            )),
                        Container(
                            width: 50,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              image: const DecorationImage(
                                image: AssetImage("assets/images/flogo.png"),
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0.30, color: Colors.white),
                                borderRadius: BorderRadius.circular(8.85),
                              ),
                            )),
                        Container(
                            width: 50,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/aplogo.png")),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0.30, color: Colors.white),
                                borderRadius: BorderRadius.circular(8.85),
                              ),
                            ))
                      ]),*/
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
