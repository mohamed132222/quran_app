import 'package:flutter/material.dart';
import 'package:quran_app/home_screen/screens/home_screen.dart';
import 'package:quran_app/my_theme/my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {HomeScreen.routeName: (_) => HomeScreen()},
      theme: MyTheme.lightTheme,
    );
  }
}
