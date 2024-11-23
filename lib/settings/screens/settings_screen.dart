import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/my_theme/my_theme.dart';
import 'package:quran_app/settings/widgets/language_bottom_sheet_screen.dart';
import 'package:quran_app/settings/widgets/theme_bottom_sheet_screen.dart';

import '../../provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigData>(context);

    return Padding(
      padding: EdgeInsets.all(20.0).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: provider.appTheme == ThemeMode.light
                ? Theme.of(context).textTheme.titleMedium
                : Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: MyTheme.yellowColor),
          ),
          10.verticalSpace,
          InkWell(
            onTap: () {
              LanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 5.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: provider.appTheme == ThemeMode.light
                      ? MyTheme.lightPrimaryColor
                      : MyTheme.darkPrimaryColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == "ar"
                        ? AppLocalizations.of(context)!.arabic
                        : AppLocalizations.of(context)!.english,
                    style: provider.appTheme == ThemeMode.light
                        ? Theme.of(context).textTheme.titleMedium
                        : Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: MyTheme.yellowColor),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.blackColor
                        : MyTheme.yellowColor,
                  )
                ],
              ),
            ),
          ),
          15.verticalSpace,
          Text(
            AppLocalizations.of(context)!.theme,
            style: provider.appTheme == ThemeMode.light
                ? Theme.of(context).textTheme.titleMedium
                : Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: MyTheme.yellowColor),
          ),
          10.verticalSpace,
          InkWell(
            onTap: () {
              ThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 5.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30).r,
                  color: provider.appTheme == ThemeMode.light
                      ? MyTheme.lightPrimaryColor
                      : MyTheme.darkPrimaryColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appTheme == ThemeMode.light
                        ? AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.dark,
                    style: provider.appTheme == ThemeMode.light
                        ? Theme.of(context).textTheme.titleMedium
                        : Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: MyTheme.yellowColor),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.blackColor
                        : MyTheme.yellowColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void LanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheetScreen(),
    );
  }

  void ThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheetScreen(),
    );
  }
}
