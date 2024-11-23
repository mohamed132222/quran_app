import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/home_screen/screens/home_screen.dart';
import 'package:quran_app/provider/provider.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "SplashScreen";

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigData>(context);
    if (provider.appTheme == ThemeMode.light) {
      return AnimatedSplashScreen(
        splash: 'assets/images/logo.png',
        splashIconSize: 180.r,
        backgroundColor: Color(0xffFFFFFF),
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.rotationTransition,
        pageTransitionType: PageTransitionType.leftToRight,
      );
    } else {
      return AnimatedSplashScreen(
        splash: 'assets/images/logodark.png',
        splashIconSize: 180.r,
        backgroundColor: Color(0xff141A2E),
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.rotationTransition,
        pageTransitionType: PageTransitionType.leftToRight,
      );
    }
  }
}
