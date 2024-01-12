import 'package:flutter/material.dart';
import 'package:tobetoapp/widgets/profile/edit/personal_edit.dart';

const List<Tab> tabs = <Tab>[
  Tab(icon: Icon(Icons.person_outline)),
  Tab(icon: Icon(Icons.work_outline)),
  Tab(icon: Icon(Icons.menu_book)),
  Tab(icon: Icon(Icons.workspace_premium_outlined)),
  Tab(icon: Icon(Icons.cast_for_education)),
  Tab(icon: Icon(Icons.public)),
  Tab(icon: Icon(Icons.translate)),
  Tab(icon: Icon(Icons.settings)),
];

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(title: Text("deneme")),
        body: Column(
          children: [
            const TabBar(
              isScrollable: true,
              tabs: tabs,
            ),
            PersonalEdit()
          ],
        ),
      ),
    );
  }
}
