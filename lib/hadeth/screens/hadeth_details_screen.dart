import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/hadeth/widgets/hadeth_details_item.dart';

import '../../provider/provider.dart';
import 'hadeth_screen.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "HadethDetailsScreen";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigData>(context);
    var args = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Stack(children: [
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
            title: Text(args.title),
          ),
          body: HadethDetailsItem(hadeth: args))
    ]);
  }
}
