import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // async required for functions that use await keyword
  void setupWorldTime() async{
    WorldTime instance = WorldTime(location:"Kolkata",url:"Asia/Kolkata");
    await instance.getTime();

    //Doesn't stack up the previous screen, rather replaces it.
    // Also, we pass data among screens as below.
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'time':instance.time,
      'dayTime': instance.isDayTime,
    });
  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
          child: SpinKitRipple(
            color: Colors.greenAccent,
            size: 200.0,
          ),
        ),
      );
  }
}
