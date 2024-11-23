import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/my_theme/my_theme.dart';
import 'package:quran_app/provider/provider.dart';

class LanguageBottomSheetScreen extends StatefulWidget {
  @override
  State<LanguageBottomSheetScreen> createState() =>
      _LanguageBottomSheetScreenState();
}

class _LanguageBottomSheetScreenState extends State<LanguageBottomSheetScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigData>(context);
    return Container(
      color: provider.appTheme == ThemeMode.light
          ? MyTheme.whiteColor
          : MyTheme.darkPrimaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
            },
            child: provider.appLanguage == "en"
                ? selectedItem(AppLocalizations.of(context)!.english, provider)
                : unSelectedItem(
                    AppLocalizations.of(context)!.english, provider),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
            },
            child: provider.appLanguage == "ar"
                ? selectedItem(AppLocalizations.of(context)!.arabic, provider)
                : unSelectedItem(
                    AppLocalizations.of(context)!.arabic, provider),
          )
        ],
      ),
    );
  }

  Widget unSelectedItem(String text, AppConfigData provider) {
    return Padding(
      padding: EdgeInsets.all(15.0).r,
      child: Text(
        text,
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
    );
  }

  Widget selectedItem(String text, AppConfigData provider) {
    return Padding(
      padding: EdgeInsets.all(15.0).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: provider.appTheme == ThemeMode.light
                  ? Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: MyTheme.lightPrimaryColor)
                  : Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: MyTheme.yellowColor)),
          Icon(
            Icons.check,
            color: provider.appTheme == ThemeMode.light
                ? MyTheme.lightPrimaryColor
                : MyTheme.yellowColor,
          )
        ],
      ),
    );
  }
}
