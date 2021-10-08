import 'package:flutter/material.dart';
import 'package:luga_fataa/home/home.dart';

import 'constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Luga Fataa',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: kBackgroundColor,
        ),),
      ),
      //  visualDensity: VisualDensity.adaptivePlatformDensity,),
        home: HomeScreen(),
    );
  }
}