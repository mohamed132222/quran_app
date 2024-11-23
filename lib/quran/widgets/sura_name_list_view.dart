import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/provider/provider.dart';

import '../../my_theme/my_theme.dart';
import '../screens/sura_details_screen.dart';

class SuraNameListView extends StatelessWidget {
  List<String> suraNameList;

  SuraNameListView({required this.suraNameList});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigData>(context);
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          height: 10,
          thickness: 3,
          color: provider.appTheme == ThemeMode.light
              ? Theme.of(context).primaryColor
              : MyTheme.yellowColor,
        ),
        itemBuilder: (context, index) => Center(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                  arguments: SuraDetailsArg(
                      suraName: suraNameList[index], index: index));
            },
            child: Text(
              suraNameList[index],
              style: provider.appTheme == ThemeMode.light
                  ? Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w400)
                  : Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400, color: MyTheme.whiteColor),
            ),
          ),
        ),
        itemCount: suraNameList.length,
      ),
    );
  }
}
