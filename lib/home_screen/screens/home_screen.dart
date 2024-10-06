import 'package:flutter/material.dart';
import 'package:quran_app/hadeth/screens/hadeth_screen.dart';
import 'package:quran_app/quran/screens/quran_screen.dart';
import 'package:quran_app/radio/screens/radio_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/default_bg.png",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Islamic"),
          ),
          bottomNavigationBar: Theme(
            data: ThemeData(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/icon_quran.png")),
                      label: "quran"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                          AssetImage("assets/images/icon_hadeth.png")),
                      label: "hadeth"),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/icon_radio.png")),
                      label: "radio"),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                      label: "sebha"),
                ]),
          ),
          body: tabs[selectedIndex],
        )
      ],
    );
  }

  List<Widget> tabs = [
    RadioScreen(),
    QuranScreen(),
    HadethScreen(),
    HadethScreen()
  ];
}
