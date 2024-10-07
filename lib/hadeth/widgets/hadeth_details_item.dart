import 'package:flutter/material.dart';
import 'package:quran_app/hadeth/screens/hadeth_screen.dart';

import '../../my_theme/my_theme.dart';

class HadethDetailsItem extends StatelessWidget {
  Hadeth hadeth;

  HadethDetailsItem({required this.hadeth});

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
                return hadeth.content.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: MyTheme.lightPrimaryColor,
                      ))
                    : Text(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        "${hadeth.content[index]}",
                        style: TextStyle(
                          fontSize: 24,
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
