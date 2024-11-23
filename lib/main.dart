import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/home_screen/screens/home_screen.dart';
import 'package:quran_app/my_theme/my_theme.dart';
import 'package:quran_app/provider/provider.dart';
import 'package:quran_app/quran/screens/sura_details_screen.dart';
import 'package:quran_app/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'hadeth/screens/hadeth_details_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigData(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late AppConfigData provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigData>(context);
    initSharedPref();
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (_) => SplashScreen(),
            HomeScreen.routeName: (_) => HomeScreen(),
            SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
            HadethDetailsScreen.routeName: (_) => HadethDetailsScreen()
          },
          theme: MyTheme.lightTheme,
          locale: Locale(provider.appLanguage),
          darkTheme: MyTheme.darkTheme,
        );
      },
    );
  }

  Future<void> initSharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? language = prefs.getString('language');
    if (language != null) {
      provider.changeLanguage(language);
    }
    final String? theme = prefs.getString('theme');
    if (theme == "light") {
      provider.changeTheme(ThemeMode.light);
    } else {
      provider.changeTheme(ThemeMode.dark);
    }
  }
}
