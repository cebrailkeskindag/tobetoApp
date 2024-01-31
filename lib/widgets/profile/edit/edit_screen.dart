import 'package:flutter/material.dart';
import 'package:tobetoapp/widgets/drawer.dart';
import 'package:tobetoapp/widgets/profile/edit/certificate_edit.dart';
import 'package:tobetoapp/widgets/profile/edit/education_edit.dart';
import 'package:tobetoapp/widgets/profile/edit/experience_edit.dart';
import 'package:tobetoapp/widgets/profile/edit/language_edit.dart';
import 'package:tobetoapp/widgets/profile/edit/perfection_edit.dart';
import 'package:tobetoapp/widgets/profile/edit/personal_edit.dart';
import 'package:tobetoapp/widgets/profile/edit/settings_edit.dart';
import 'package:tobetoapp/widgets/profile/edit/social_media_edit.dart';

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

int selectedIndex = 0;

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    String tobetoAppbarLogo = currentBrightness == Brightness.light
        ? 'assets/images/tobeto_logo.png'
        : 'assets/images/tobeto_logo_d.png';
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    return DefaultTabController(
        length: tabs.length,
        child: Builder(builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              setState(() {
                //print(tabController.index);
                selectedIndex = tabController.index;
              });
            }
          });

          return Scaffold(
              resizeToAvoidBottomInset: false,
              endDrawer: const DrawerMenu(),
              appBar: AppBar(
                centerTitle: false,
                automaticallyImplyLeading: false,
                title: Image.asset(
                  tobetoAppbarLogo,
                  width: 150,
                ),
              ),
              body: Column(
                children: [
                  const TabBar(
                    isScrollable: true,
                    tabs: tabs,
                  ),
                  SizedBox(
                    width: screenWidth / 0.20,
                    child: _buildTabContent(selectedIndex),
                  ),
                ],
              ));
        }));
  }

  Widget _buildTabContent(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return const PersonalEdit();
      case 1:
        return const SingleChildScrollView(child: ExperienceEdit());
      case 2:
        return const SingleChildScrollView(child: EducationEdit());
      case 3:
        return const SingleChildScrollView(child: PerfectionEdit());
      case 4:
        return const SingleChildScrollView(child: CertificateEdit());
      case 5:
        return const SingleChildScrollView(child: SocialMediaEdit());
      case 6:
        return const SingleChildScrollView(child: LanguageEdit());
      default:
        return const SingleChildScrollView(
            child: SettingsEdit()); // Default durum için boş bir container
    }
  }
}
