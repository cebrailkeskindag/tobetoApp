import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16),
        backgroundColor: const Color.fromARGB(200, 101, 20, 200),
        minimumSize: const Size(290, 40));
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/login_background.png"),
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
                  child: Image.asset("assets/images/tobeto_logo.png"),
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
                          hintText: "Kullanıcı adını giriniz",
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
                            hintText: "Parola giriniz",
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
                  height: 25,
                ),
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {},
                  child: const Text(
                    "GİRİŞ YAP",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
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
