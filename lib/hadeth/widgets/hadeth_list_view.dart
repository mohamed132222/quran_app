import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../my_theme/my_theme.dart';
import '../../provider/provider.dart';
import '../screens/hadeth_details_screen.dart';
import '../screens/hadeth_screen.dart';

class HadethListView extends StatelessWidget {
  List<Hadeth> ahadethList;

  HadethListView({required this.ahadethList});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigData>(context);
    return Expanded(
        child: ListView.separated(
      separatorBuilder: (context, index) => Divider(
        height: 10.h,
        thickness: 3,
        color: provider.appTheme == ThemeMode.light
            ? MyTheme.lightPrimaryColor
            : MyTheme.yellowColor,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
                arguments: Hadeth(
                    content: ahadethList[index].content,
                    title: ahadethList[index].title));
          },
          child: Center(
            child: Text(
              ahadethList[index].title,
              style: provider.appTheme == ThemeMode.light
                  ? Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w400)
                  : Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: MyTheme.whiteColor),
            ),
          ),
        );
      },
      itemCount: ahadethList.length,
    ));
  }
}
