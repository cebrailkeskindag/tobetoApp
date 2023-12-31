import 'package:flutter/material.dart';
import 'package:tobetoapp/screen/homepage_screen.dart';
import 'package:tobetoapp/theme/app_color.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    String imageName = currentBrightness == Brightness.light
        ? 'assets/images/tobeto_logo.png'
        : 'assets/images/tobeto_logo_d.png';
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16),
        backgroundColor: (AppColorDark.elevatedButtonColor),
        minimumSize: const Size(290, 40));
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/login_background2.png"),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Card(
              child: SizedBox(
            width: 350,
            height: 360,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  child: Image.asset(imageName),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: TextField(
                      decoration: InputDecoration(
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
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Parola giriniz",
                            hintStyle: TextStyle(fontFamily: "Poppins"),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.visibility_off)),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                      ),
                    )),
                const SizedBox(
                  height: 20,
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
                const Divider(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Parolamı Unuttum",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
