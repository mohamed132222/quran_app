import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:quran_app/my_theme/my_theme.dart';
import 'package:quran_app/provider/provider.dart';
import 'package:quran_app/radio/model/radioResponse.dart';
import 'package:quran_app/radio/widgets/radio_item.dart';

class RadioScreen extends StatelessWidget {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigData>(context);
    return FutureBuilder(
      future: getRadios(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var radio = snapshot.data?.radios ?? [];
          return Center(
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Image.asset("assets/images/radio_image.png")),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: PageScrollPhysics(),
                    itemBuilder: (_, index) => RadioItem(
                      radio: radio[index],
                      audioPlayer: player,
                    ),
                    itemCount: radio.length,
                  ),
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text("error from server"),
              ElevatedButton(
                  onPressed: () => getRadios, child: Text("try again"))
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: provider.appTheme == ThemeMode.light
                  ? MyTheme.lightPrimaryColor
                  : MyTheme.yellowColor,
            ),
          );
        }
      },
    );
  }

  Future<RadioResponse?> getRadios() async {
    Uri url = Uri.parse("https://mp3quran.net/api/v3/radios");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return RadioResponse.fromJson(json);
    } else {
      throw Exception("failed load radio data");
    }
  }
}
