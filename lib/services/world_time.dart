import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  late String location; // location name for the UI
  late String time; // the time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint
  bool isDaytime; // true or false if daytime or not

  WorldTime({ required this.location, required this.flag, required this.url, required this.isDaytime});

  Future<void> getTime() async {

    try {
      // make the request
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      // Get properties from data
      String datetime = data ['datetime'];
      String offset = data ['utc_offset'].substring(1,3);
      // print(datetime);
      // print (offset);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      // set the time property
      //time = now.toString();
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      if (kDebugMode) {
        print('caught error: $e');
      }

    time = 'could not get time data';
    }


  }

}
