import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:tobetoapp/widgets/circular_button.dart';
import 'package:tobetoapp/widgets/footer_bar.dart';
import 'package:tobetoapp/widgets/info_card.dart';
import 'package:tobetoapp/widgets/category_card.dart';

import 'package:tobetoapp/widgets/drawer.dart';
import 'package:tobetoapp/widgets/exam_card.dart';
import 'package:tobetoapp/widgets/trainings_card.dart';

import '../theme/app_color.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Başvurularım'),
  Tab(text: 'Eğitimlerim'),
  Tab(text: 'Duyuru ve Haberlerim'),
  Tab(text: 'Anketlerim'),
];

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

int selectedIndex = 0;

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    Color tColor = currentBrightness == Brightness.light
        ? AppColorLight.textColor
        : AppColorDark.textColor;
    String istkodluyor = currentBrightness == Brightness.light
        ? 'assets/images/istkodluyor.png'
        : 'assets/images/istkodluyor_dark.png';
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Ekran genişliği
    double screenWidth = mediaQuery.size.width;

    // Ekran yüksekliği
    //double screenHeight = mediaQuery.size.height;
    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            setState(() {
              //print(tabController.index);
              selectedIndex = tabController.index;
              print("Selected index: $selectedIndex");
            });
          }
        });
        return Scaffold(
          endDrawer: const DrawerMenu(),
          appBar: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: Image.asset(
              "assets/images/tobeto_logo.png",
              width: 150,
            ),
          ),
          floatingActionButton: CircularButton(),
          body: FooterView(
              footer: Footer(child: const FooterBar()),
              flex: 10,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: "TOBETO",
                                    style: const TextStyle(
                                        color: Colors.purple,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                    children: [
                                      TextSpan(
                                        text: "'ya hoş geldin  Kullanıcı_adı",
                                        style: TextStyle(
                                            color: tColor,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ]))),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth / 20),
                        child: const Text(
                          "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth / 20),
                          child: Card(
                            color: Theme.of(context).colorScheme.background,
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth / 80),
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: screenWidth / 3,
                                      child: Image.asset(istkodluyor)),
                                  const Text(
                                    " Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.",
                                    textAlign: TextAlign.center,
                                  ),
                                  const Text(
                                    "  Aradığın \"İş\" Burada ",
                                  ),
                                  const Wrap(
                                    children: [
                                      TabBar(
                                        isScrollable: true,
                                        tabs: tabs,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      width: screenWidth / 0.20,
                                      child:
                                          //  Text("selected index: $selectedIndex"),
                                          //const InfoCard(),
                                          _buildTabContent(selectedIndex)
                                      // SizedBox(width: screenWidth / 0.20, child: TrainingsCard(),
                                      ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: screenWidth / 0.20, child: const ExamCard()),
                      SizedBox(
                          width: screenWidth / 0.20,
                          child: const CategoryCard()),
                    ],
                  ),
                ),
              ]),
        );
      }),
    );
  }

  Widget _buildTabContent(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return InfoCard();
      case 1:
        return TrainingsCard();
      case 2:
        return Text("Duyuru ve Haberler Gelecek");
      case 3:
        return Text("Anketler Gelecek");
      default:
        return InfoCard(); // Default durum için boş bir container
    }
  }
}
