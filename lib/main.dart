import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/pages/account_page.dart';
import 'package:quizz_app/pages/home_page.dart';
import 'package:quizz_app/pages/quizz_page.dart';
import 'package:quizz_app/providers/quizz_provider.dart';
import 'package:quizz_app/theme/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => QuizzProvider(),
      child:const MainApp() ,
    ),
    );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int tabIndex = 0;
  final _pages = [
    const HomePage(),
    const QuizzPage(),
    const AccountPage()
  ];
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.theme,
      home: Scaffold(
        body: _pages[tabIndex],
        bottomNavigationBar: CircleNavBar(
        activeIndex: tabIndex,
        onTap: (index){
          setState(() {
            tabIndex = index;
          });
        },
        activeIcons: const [
          Icon(Icons.home, color: Color.fromARGB(255, 0, 53, 84)),
          Icon(Icons.quiz, color: Color.fromARGB(255, 0, 53, 84)),
          Icon(Icons.person, color: Color.fromARGB(255, 0, 53, 84)),
        ],
        inactiveIcons: const [
          Text("Home", style: TextStyle(color: Color.fromARGB(255, 255, 250, 255)),),
          Text("Quizz", style: TextStyle(color: Color.fromARGB(255, 255, 250, 255)),),
          Text("Account", style: TextStyle(color: Color.fromARGB(255, 255, 250, 255)),),
        ],
        color: Color.fromARGB(255, 0, 53, 84),
        circleColor: Colors.white,
        height: 65,
        circleWidth: 60,
        // tabCurve: ,
        
        cornerRadius: const BorderRadius.all(Radius.zero),
        circleShadowColor: Color.fromARGB(255, 0, 53, 84),
        elevation: 10,
        
      ),
      ),
    );
  }
}
