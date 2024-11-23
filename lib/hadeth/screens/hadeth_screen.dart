import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/hadeth/widgets/hadeth_list_view.dart';

import '../../my_theme/my_theme.dart';
import '../../provider/provider.dart';

class HadethScreen extends StatefulWidget {
  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigData>(context);

    if (ahadethList.isEmpty) {
      loadHadeth();
    }
    return Column(
      children: [
        Center(child: Image.asset("assets/images/hadeth_logo.png")),
        Divider(
            height: 5.h,
            thickness: 3,
            color: provider.appTheme == ThemeMode.light
                ? MyTheme.lightPrimaryColor
                : MyTheme.yellowColor),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: provider.appTheme == ThemeMode.light
              ? Theme.of(context).textTheme.titleMedium
              : Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: MyTheme.whiteColor),
        ),
        Divider(
            height: 5.h,
            thickness: 3,
            color: provider.appTheme == ThemeMode.light
                ? MyTheme.lightPrimaryColor
                : MyTheme.yellowColor),
        HadethListView(ahadethList: ahadethList)
      ],
    );
  }

  void loadHadeth() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadethList = content.split("#\r\n");
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLine = hadethList[i].split("\n");
      String title = hadethLine[0];
      hadethLine.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLine);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.content, required this.title});
}
