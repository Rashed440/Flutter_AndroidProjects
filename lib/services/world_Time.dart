import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location; //location name for the UI
  String? time; //the time in that location
  String? flag; //url to an asset flag location
  String? url; //location url for api endpoint
  bool? isDaytime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getData() async {
    try {
      //make the  request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      Map data = jsonDecode(response.body);
      //get the properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'];

      offset = offset.substring(1, 3);

      //create datetime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Loading';
    }
  }
}
