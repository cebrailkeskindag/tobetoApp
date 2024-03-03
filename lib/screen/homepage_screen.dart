import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tobetoapp/constants/constants_firabase.dart';
import 'package:tobetoapp/widgets/homepage/circular_button.dart';
import 'package:tobetoapp/widgets/homepage/education_firebase.dart';
import 'package:tobetoapp/widgets/homepage/exam_firebase.dart';
import 'package:tobetoapp/widgets/homepage/info_card.dart';
import 'package:tobetoapp/widgets/homepage/category_card.dart';

import 'package:tobetoapp/widgets/homepage/drawer.dart';
import 'package:tobetoapp/widgets/homepage/news_card_firebase.dart';
import 'package:tobetoapp/widgets/homepage/page_view.dart';
import 'package:tobetoapp/widgets/homepage/survey_card.dart';
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
String _name = '';
String _surname = '';
String _usermail = '';
String _usermailExam = '';
String _title = '';
final firebaseAuthInstance = FirebaseAuth.instance;

final firebaseFireStore = FirebaseFirestore.instance;

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  void initState() {
    super.initState();

    _getUserInfo();
  }

  void _getUserInfo() async {
    final user = firebaseAuthInstance.currentUser;
    final document =
        firebaseFireStore.collection(ConstanstFirebase.USERS).doc(user!.uid);
    final documentSnapshot = await document.get();

    String formatTimestamp(Timestamp timestamp, String format) {
      DateTime dateTime = timestamp.toDate();
      return DateFormat(format).format(dateTime);
    }

    if (mounted) {
      if (documentSnapshot.exists) {
        setState(() {
          _name = documentSnapshot.get("name");
          _usermail = documentSnapshot.get("email");
        });
      }
    }
  }

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

    double screenWidth = mediaQuery.size.width;

    String welcomeText = _name.isNotEmpty
        ? "'ya Hoş Geldin, ${_name}"
        : "'ya Hoş Geldin, Sevgili Öğrencimiz";

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
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth / 60),
                    child: Container(
                      color: Theme.of(context).colorScheme.background,
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth / 100),
                        child: Column(
                          children: [
                            const homePageView(),
                            const TabBar(
                              isScrollable: true,
                              tabs: tabs,
                            ),
                            SizedBox(
                              width: screenWidth / 0.20,
                              child: _buildTabContent(selectedIndex),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: screenWidth / 0.20, child: const ExamFirebase()),
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
        return const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              EducationFirebase(),
            ],
          ),
        );
      case 2:
        return const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(child: NewsCardFirebase()),
            ],
          ),
        );
      case 3:
        return const SurveyCard();
      default:
        return const InfoCard();
    }
  }
}
