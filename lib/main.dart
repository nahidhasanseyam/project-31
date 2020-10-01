import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/home.dart';
import 'views/first_view.dart';

void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: Home(),
      home: FirstView(),
      routes: <String, WidgetBuilder>{
        '/signUp': (BuildContext context) => Home(),
        '/home': (BuildContext context) => Home(),
      },
    );
  }
}
