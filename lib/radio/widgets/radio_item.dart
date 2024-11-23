import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' hide Radio;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../my_theme/my_theme.dart';
import '../../provider/provider.dart';
import '../model/radioResponse.dart';

class RadioItem extends StatelessWidget {
  Radio radio;
  AudioPlayer audioPlayer;

  RadioItem({required this.radio, required this.audioPlayer});

  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigData>(context);

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          Text(
            radio.name ?? "",
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
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () => player.play(UrlSource(radio.url!)),
                  icon: Icon(
                    Icons.play_arrow_sharp,
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.lightPrimaryColor
                        : MyTheme.yellowColor,
                    size: 40.r,
                  )),
              IconButton(
                  onPressed: player.stop,
                  icon: Icon(
                    Icons.stop,
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.lightPrimaryColor
                        : MyTheme.yellowColor,
                    size: 40.r,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
