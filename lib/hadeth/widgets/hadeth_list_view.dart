import 'package:flutter/material.dart';

import '../screens/hadeth_details_screen.dart';
import '../screens/hadeth_screen.dart';

class HadethListView extends StatelessWidget {
  List<Hadeth> ahadethList;

  HadethListView({required this.ahadethList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      separatorBuilder: (context, index) => Divider(
        height: 10,
        thickness: 3,
        color: Theme.of(context).primaryColor,
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
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
        );
      },
      itemCount: ahadethList.length,
    ));
  }
}
