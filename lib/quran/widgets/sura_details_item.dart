import 'package:flutter/material.dart';

import '../../my_theme/my_theme.dart';

class SuraDetailsItem extends StatelessWidget {
  List<String> suraContent;

  SuraDetailsItem({required this.suraContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .1,
          vertical: MediaQuery.of(context).size.width * .1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: MyTheme.whiteColor,
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
