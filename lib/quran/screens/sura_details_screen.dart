import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/provider/provider.dart';
import 'package:quran_app/quran/widgets/sura_details_item.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetailsScreen";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> suraContent = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigData>(context);
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArg;
    if (suraContent.isEmpty) {
      loadContent(args.index);
    }

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
            title: Text(args.suraName),
          ),
          body: SuraDetailsItem(
            suraContent: suraContent,
          ))
    ]);
  }

  void loadContent(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.trim().split("\n");
    suraContent = lines;
    print(lines);
    setState(() {});
  }
}

class SuraDetailsArg {
  String suraName;
  int index;

  SuraDetailsArg({required this.suraName, required this.index});
}
