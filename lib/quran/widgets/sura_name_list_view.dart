import 'package:flutter/material.dart';

import '../screens/sura_details_screen.dart';

class SuraNameListView extends StatelessWidget {
  List<String> suraNameList;

  SuraNameListView({required this.suraNameList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          height: 10,
          thickness: 3,
          color: Theme.of(context).primaryColor,
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
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
        ),
        itemCount: suraNameList.length,
      ),
    );
  }
}
