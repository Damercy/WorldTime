import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
  WorldTime(location:"Toronto",url:"America/Toronto"),
  WorldTime(location:"Seoul",url:"Asia/Seoul"),
  WorldTime(location:"Berlin",url:"Europe/Berlin"),
  WorldTime(location:"Kolkata",url:"Asia/Kolkata"),
  WorldTime(location:"London",url:"Europe/London"),
  WorldTime(location:"Chicago",url:"America/Chicago"),
  WorldTime(location:"New York",url:"America/New_York"),
  ];

  WorldTime instance;

  Future<void> updateTime(index) async{
    instance = locations[index];
    await instance.getTime();
    print(instance.isDayTime);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text('Location'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder:(context,index){
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(),
            child: ListTile(
              title: Text(locations[index].location),
              onTap: () async {
                await updateTime(index);
                Navigator.pop(context,{
                'location':instance.location,
                'time':instance.time,
                'dayTime': instance.isDayTime,
              });},
              subtitle: Text(locations[index].url.substring(0,locations[index].url.indexOf("/"))),
            ),
          ),
        );
      },
      itemCount: locations.length,),
    );
  }
}
