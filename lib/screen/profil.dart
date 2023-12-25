import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:tobetoapp/widgets/circular_button.dart';
import 'package:tobetoapp/widgets/drawer.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Başvurularım'),
  Tab(text: 'Eğitimlerim'),
  Tab(text: 'Duyuru ve Haberlerim'),
  Tab(text: 'Anketlerim'),
];

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          drawer: const DrawerMenu(),
          appBar: AppBar(
            bottom: const TabBar(
              tabs: tabs,
            ),
          ),
          floatingActionButton: CircularButton(),
          body: TabBarView(
            children: tabs.map((Tab tab) {
              return Center(
                child: Text(
                  '${tab.text!} Tab',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
