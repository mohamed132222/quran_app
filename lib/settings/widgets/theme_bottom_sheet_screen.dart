import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/my_theme/my_theme.dart';
import 'package:quran_app/provider/provider.dart';

class ThemeBottomSheetScreen extends StatefulWidget {
  @override
  State<ThemeBottomSheetScreen> createState() => _ThemeBottomSheetScreenState();
}

class _ThemeBottomSheetScreenState extends State<ThemeBottomSheetScreen> {
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
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.appTheme == ThemeMode.light
                ? selectedItem(AppLocalizations.of(context)!.light, provider)
                : unSelectedItem(AppLocalizations.of(context)!.light, provider),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.appTheme == ThemeMode.dark
                ? selectedItem(AppLocalizations.of(context)!.dark, provider)
                : unSelectedItem(AppLocalizations.of(context)!.dark, provider),
          )
        ],
      ),
    );
  }

  Widget unSelectedItem(String text, AppConfigData provider) {
    return Padding(
      padding: EdgeInsets.all(15.0).r,
      child: Text(text,
          style: TextStyle(
              color: provider.appTheme == ThemeMode.light
                  ? MyTheme.blackColor
                  : MyTheme.whiteColor)),
    );
  }

  Widget selectedItem(String text, AppConfigData provider) {
    return Padding(
      padding: const EdgeInsets.all(15.0).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: provider.appTheme == ThemeMode.light
                ? Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: MyTheme.lightPrimaryColor)
                : Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: MyTheme.yellowColor),
          ),
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
