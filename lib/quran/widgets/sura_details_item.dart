import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/provider/provider.dart';

import '../../my_theme/my_theme.dart';

class SuraDetailsItem extends StatelessWidget {
  List<String> suraContent;

  SuraDetailsItem({required this.suraContent});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigData>(context);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .1,
          vertical: MediaQuery.of(context).size.width * .1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: provider.appTheme == ThemeMode.light
            ? MyTheme.whiteColor
            : MyTheme.darkPrimaryColor,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return suraContent.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: MyTheme.lightPrimaryColor,
                      ))
                    : Text(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        "${suraContent[index]} {${index + 1}}",
                        style: TextStyle(
                          color: provider.appTheme == ThemeMode.light
                              ? MyTheme.blackColor
                              : MyTheme.yellowColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      );
              },
              itemCount: suraContent.length,
            ),
          )
        ],
      ),
    );
  }
}
