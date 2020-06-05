import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  String bgImg;

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data: ModalRoute.of(context).settings.arguments;  // Code to receive data from loading screen
    bgImg = data['dayTime']? 'assets/day.gif':'assets/night.gif';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgImg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 80.0, 0, 0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async{
                      // For moving to another screen --- routing
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'location':result['location'],
                          'time':result['time'],
                          'dayTime': result['dayTime'],
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location,
                    color: Colors.white70,
                    size: 30),
                    label: Text('Edit Location',
                    style: TextStyle(
                      color: Colors.white70,
                      )
                    )
                ),
                SizedBox(height: 400),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'],
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white70,
                      letterSpacing: 2.0,
                    ),)
                  ],
                ),
                SizedBox(height: 20.0),
                Text(data['time'],
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 70.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
