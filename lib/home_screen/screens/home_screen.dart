import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/hadeth/screens/hadeth_screen.dart';
import 'package:quran_app/my_theme/my_theme.dart';
import 'package:quran_app/quran/screens/quran_screen.dart';
import 'package:quran_app/radio/screens/radio_screen.dart';
import 'package:quran_app/sebaha/screens/sebaha_screen.dart';
import 'package:quran_app/settings/screens/settings_screen.dart';

import '../../provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigData>(context);
    return Stack(
      children: [
        provider.appTheme == ThemeMode.light
            ? Image.asset(
                "assets/images/default_bg.png",
                fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
              )
            : Image.asset(
                "assets/images/dark_bg.png",
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
        Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
                color: provider.appTheme == ThemeMode.light
                    ? MyTheme.blackColor
                    : MyTheme.yellowColor),
            title: Text(AppLocalizations.of(context)!.islamic),
          ),
          bottomNavigationBar: Theme(
            data: ThemeData(
                canvasColor: provider.appTheme == ThemeMode.light
                    ? MyTheme.lightPrimaryColor
                    : MyTheme.darkPrimaryColor),
            child: BottomNavigationBar(
                selectedItemColor: provider.appTheme == ThemeMode.light
                    ? MyTheme.blackColor
                    : MyTheme.yellowColor,
                selectedIconTheme: IconThemeData(
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.blackColor
                        : MyTheme.yellowColor),
                currentIndex: selectedIndex,
                onTap: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/icon_quran.png")),
                      label: AppLocalizations.of(context)!.quran),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                          AssetImage("assets/images/icon_hadeth.png")),
                      label: AppLocalizations.of(context)!.hadeth),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/icon_radio.png")),
                      label: AppLocalizations.of(context)!.radio),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                      label: AppLocalizations.of(context)!.sebha),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: AppLocalizations.of(context)!.settings),
                ]),
          ),
          body: tabs[selectedIndex],
        )
      ],
    );
  }

  List<Widget> tabs = [
    QuranScreen(),
    HadethScreen(),
    RadioScreen(),
    SebahaScreen(),
    SettingsScreen()
  ];
}
