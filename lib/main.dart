import 'package:flutter/material.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';
import 'package:worldtime/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    // routes take in maps (key-value pairs). The values in routes
    // are functions as shown below, which take a required context parameter.
    routes: {
      '/':(context) => Loading(),
      '/home':(context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}