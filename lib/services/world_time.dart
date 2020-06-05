import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; // location name for UI
  String time; // required answer time of the location lol
  String url; // to be added to api
  bool isDayTime; // true if day, false if not day aka it's night

  // Future - Required if we want to use custom awaits in functions as required
  // in loading.dart function 'await instance.getTime()'. Future tells dart that the
  // function will return a future, and at some point the function will return void,
  // only when the async function gets over.
  Future<void> getTime() async{
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // filtering required props - utc_offset and utc_datetime
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'];
      String offsetHrs = offset.substring(1,offset.indexOf(":"));
      String offsetMins = offset.substring(offset.indexOf(":")+1,offset.length);
      int offsetHrsNum = int.parse(offsetHrs);
      int offsetMinsNum = int.parse(offsetMins);

      // Creating datetime
      DateTime now = DateTime.parse(datetime);

      now = offset.contains("+")? now.add(Duration(hours: offsetHrsNum ,minutes: offsetMinsNum)): now.subtract(Duration(hours: offsetHrsNum ,minutes: offsetMinsNum));
      time = DateFormat.jm().format(now);
      print(now);
      isDayTime = now.hour>=4 && now.hour<=18? true: false;
    }
    catch(e){
      time = 'Unable to fetch time data :(';
    }

  }

  WorldTime({this.location,this.url});
}
