import 'package:flutter/material.dart';
import 'package:tobetoapp/datas/datas.dart';
import 'package:tobetoapp/screen/calendar_screen.dart';
import 'package:tobetoapp/screen/catalog.dart';
import 'package:tobetoapp/screen/evaluation.dart';
import 'package:tobetoapp/screen/homepage_screen.dart';
import 'package:tobetoapp/screen/login.dart';
import 'package:tobetoapp/screen/profil.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    String imageName = currentBrightness == Brightness.light
        ? 'assets/images/tobeto_logo.png'
        : 'assets/images/tobeto_logo_d.png';
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 25),
        children: [
          Row(
            children: [
              Image.asset(
                imageName,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
              title: const Text("Anasayfa"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const HomepageScreen()));
              },
              leading: const Icon(Icons.home_outlined)),
          ListTile(
            title: const Text("Değerlendirmeler"),
            leading: const Icon(Icons.assignment_turned_in_outlined),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const Evaluation()));
            },
          ),
          ListTile(
            title: const Text("Profilim"),
            leading: const Icon(Icons.person_outlined),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const ProfilePage()));
            },
          ),
          ListTile(
            title: const Text("Katalog"),
            leading: const Icon(Icons.list_outlined),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => const Catalog()));
            },
          ),
          ListTile(
            title: const Text("Takvim"),
            leading: const Icon(Icons.date_range),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => CalendarScreen(educators: educators,)));
            },
          ),
          const Divider(),
          const ListTile(
            title: Text("Tobeto"),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/iconlogo.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              color: Theme.of(context).colorScheme.background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Text("Kullanıcı adı"),
                    const Spacer(),
                    Image.asset(
                      'assets/images/ic_user.png',
                      width: 40.0,
                      height: 40.0,
                    )
                  ],
                ),
              ),
            ),
          ),
          ListTile(
              title: const Text(
                "Çıkış Yap",
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ));
              },
              leading: const Icon(Icons.exit_to_app)),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text("© 2022 Tobeto"),
          ),
        ],
      ),
    );
  }
}
