import 'package:flutter/material.dart';
import 'package:tobetoapp/screen/homepage_screen.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 25),
        children:  [
          SizedBox(
            height: 100,
            child: DrawerHeader(
                decoration:const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/tobeto_logo.png"),
                )),
                // child:ElevatedButton(onPressed: () {Navigator.of(context).pop();}, child:Icon(Icons.cancel_outlined))
                child:IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.cancel_outlined))),
          ),
          ListTile(
              title: const Text("Anasayfa"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const HomepageScreen()));
              },
              leading:const Icon(Icons.home_outlined)),
          const ListTile(
              title: Text("Değerlendirmeler"),
              leading: Icon(Icons.assignment_turned_in_outlined)),
          const ListTile(
              title: Text("Profilim"), leading: Icon(Icons.person_outlined)),
          const ListTile(title: Text("Katalog"), leading: Icon(Icons.list_outlined)),
          const ListTile(
            title: Text("Takvim"),
            leading: Icon(Icons.date_range),
          ),
          const Divider(),
          const ListTile(
            title: Text("Tobeto"),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/iconlogo.png'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Kenar yuvarlatma değerini belirleyin
              ),

              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [Text("Kullanıcı adı"),Spacer() ,Icon(Icons.person)],
                ),
              ),
            ),
          ),
          const Padding(
            padding:  EdgeInsets.only(left: 20,top:10),
            child:  Text("© 2022 Tobeto"),
          ),
        ],
      ),
    );
  }
}
