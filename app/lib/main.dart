import 'package:flutter/material.dart';
import 'package:app/pages/set.dart';
//import 'package:flutter_ad_plugin/flutter_ad_plugin.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ledText',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: SetPage(),
    );
  }
}
