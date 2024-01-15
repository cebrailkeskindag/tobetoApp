import 'package:flutter/material.dart';
import 'package:tobetoapp/screen/homepage_screen.dart';
import 'package:tobetoapp/theme/app_color.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    String imageName = currentBrightness == Brightness.light
        ? 'assets/images/tobeto_logo.png'
        : 'assets/images/tobeto_logo_d.png';
    String backgroundLogin = currentBrightness == Brightness.light
        ? "assets/images/login_background.png"
        : 'assets/images/login_background_d.png';
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16),
        backgroundColor: (AppColorDark.elevatedButtonColor),
        minimumSize: const Size(290, 40));
    return Scaffold(
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
            height: 420,
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
                      controller: _usernameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          labelText: "Kullanıcı adı",
                          hintStyle: TextStyle(fontFamily: "Poppins"),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
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
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                            labelText: "Parola giriniz",
                            hintStyle: TextStyle(fontFamily: "Poppins"),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                              child: Icon(_isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xFFA3A3A3),
                            fontSize: 11.33,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )),
                  ],
                ),
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const HomepageScreen()));
                  },
                  child: const Text(
                    "GİRİŞ YAP",
                    style:
                        TextStyle(color: Colors.white, fontFamily: "Poppins"),
                  ),
                ),
                SizedBox(height: 15),
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
                    const Padding(
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
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          decoration: ShapeDecoration(
                            image: const DecorationImage(
                                image: AssetImage("assets/images/gologo.png")),
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
                                image: AssetImage("assets/images/aplogo.png")),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 0.30, color: Colors.white),
                              borderRadius: BorderRadius.circular(8.85),
                            ),
                          ))
                    ]),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
