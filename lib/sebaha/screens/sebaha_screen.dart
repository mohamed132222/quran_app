import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/my_theme/my_theme.dart';
import 'package:quran_app/provider/provider.dart';

class SebahaScreen extends StatefulWidget {
  @override
  State<SebahaScreen> createState() => _SebahaScreenState();
}

class _SebahaScreenState extends State<SebahaScreen> {
  double turns = 0.0;
  int count = 0;
  String tasbeh = "";
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigData>(context);
    return Center(
      child: Column(
        children: [
          provider.appTheme == ThemeMode.light
              ? Image.asset("assets/images/head_sebha_logo.png")
              : Image.asset("assets/images/head_sebha_dark.png"),
          InkWell(
              onTap: () {
                setState(() {
                  turns += 1;
                  if (count >= 0 && count < 33) {
                    tasbeh = "سبحان الله";
                  } else if (count > 32 && count < 66) {
                    tasbeh = "الحمد الله";
                  } else if (count > 65 && count <= 99) {
                    tasbeh = "الله اكبر";
                  } else {
                    count = 0;
                  }
                  count++;
                });
              },
              child: AnimatedRotation(
                  turns: turns,
                  duration: Duration(seconds: 5),
                  child: provider.appTheme == ThemeMode.light
                      ? Image.asset("assets/images/body_sebha_logo.png")
                      : Image.asset("assets/images/body_sebha_dark.png"))),
          15.verticalSpace,
          Text(
            AppLocalizations.of(context)!.numberoftasbeeh,
            style: provider.appTheme == ThemeMode.light
                ? Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: MyTheme.blackColor)
                : Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: MyTheme.whiteColor),
          ),
          5.verticalSpace,
          Container(
            width: 69.w,
            height: 81.h,
            decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.light
                    ? MyTheme.lightPrimaryColor
                    : MyTheme.yellowColor,
                borderRadius: BorderRadius.circular(24).r),
            child: Center(
                child: Text(
              "$count",
              style: provider.appTheme == ThemeMode.light
                  ? Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400, color: MyTheme.blackColor)
                  : Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400, color: MyTheme.whiteColor),
            )),
          ),
          5.verticalSpace,
          Container(
            height: 51.h,
            width: 137.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25).r,
                color: provider.appTheme == ThemeMode.light
                    ? MyTheme.lightPrimaryColor
                    : MyTheme.yellowColor),
            child: Center(
                child: Text(
              tasbeh,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w400, color: MyTheme.whiteColor),
            )),
          )
        ],
      ),
    );
  }
}
