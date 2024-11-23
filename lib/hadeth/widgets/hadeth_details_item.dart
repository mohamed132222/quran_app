import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/hadeth/screens/hadeth_screen.dart';

import '../../my_theme/my_theme.dart';
import '../../provider/provider.dart';

class HadethDetailsItem extends StatelessWidget {
  Hadeth hadeth;

  HadethDetailsItem({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigData>(context);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .1,
          vertical: MediaQuery.of(context).size.width * .1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24).r,
        color: provider.appTheme == ThemeMode.light
            ? MyTheme.whiteColor
            : MyTheme.darkPrimaryColor,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return hadeth.content.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: provider.appTheme == ThemeMode.light
                            ? MyTheme.lightPrimaryColor
                            : MyTheme.yellowColor,
                      ))
                    : Text(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        "${hadeth.content[index]}",
                        style: TextStyle(
                          color: provider.appTheme == ThemeMode.light
                              ? MyTheme.blackColor
                              : MyTheme.yellowColor,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      );
              },
              itemCount: hadeth.content.length,
            ),
          )
        ],
      ),
    );
  }
}
