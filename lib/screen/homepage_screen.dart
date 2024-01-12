import 'package:flutter/material.dart';
import 'package:tobetoapp/datas/datas.dart';
import 'package:tobetoapp/models/exam.dart';
import 'package:tobetoapp/models/news.dart';
import 'package:tobetoapp/models/training.dart';
import 'package:tobetoapp/widgets/circular_button.dart';
import 'package:tobetoapp/widgets/info_card.dart';
import 'package:tobetoapp/widgets/category_card.dart';

import 'package:tobetoapp/widgets/drawer.dart';
import 'package:tobetoapp/widgets/exam_card.dart';
import 'package:tobetoapp/widgets/news_card.dart';
import 'package:tobetoapp/widgets/survey_card.dart';
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
    String tobetoAppbarLogo = currentBrightness == Brightness.light
        ? 'assets/images/tobeto_logo.png'
        : 'assets/images/tobeto_logo_d.png';
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
              tobetoAppbarLogo,
              width: 150,
            ),
          ),
          floatingActionButton: const CircularButton(),
          body: SingleChildScrollView(
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
                    padding: EdgeInsets.all(screenWidth / 30),
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
                            RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: "Aradığın",
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      fontSize: 30,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: " \"",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: "İş",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "\"",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: " Burada!",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                        ),
                                      )
                                    ])),
                            const TabBar(
                              isScrollable: true,
                              tabs: tabs,
                            ),
                            SizedBox(
                              width: screenWidth / 0.20,
                              child:
                                  ////Text("selected index: $selectedIndex"),
                                  //const InfoCard(),
                                  _buildTabContent(selectedIndex),
                              // SizedBox(width: screenWidth / 0.20, child: TrainingsCard(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth / 0.20,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (Exam exam in examList) ExamCard(exam: exam),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    width: screenWidth / 0.20, child: const CategoryCard()),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTabContent(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return const InfoCard();
      case 1:
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (Training training in trainingsList)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TrainingsCard(training: training),
                ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.3), // Gölge rengi
                              spreadRadius: 4, // Yayılma yarıçapı
                              blurRadius: 10, // Bulanıklık yarıçapı
                              // Gölgeyi kaydırma
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            // IconButton'a basıldığında yapılacak işlemler
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text("Daha Fazla Göster")
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      case 2:
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (News news in newsList)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NewsCard(news: news),
                ),
            ],
          ),
        );
      case 3:
        return const SurveyCard();
      default:
        return const InfoCard(); // Default durum için boş bir container
    }
  }
}
