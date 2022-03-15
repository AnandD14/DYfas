import 'package:flutter/material.dart';
import 'package:luga_fataa/dyfas_theme.dart';
import 'package:luga_fataa/home/home.dart';
import 'package:luga_fataa/dyfas_theme.dart';


import 'constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = DyfasTheme.light();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DYFAS',

      theme: theme,
      //  visualDensity: VisualDensity.adaptivePlatformDensity,),
      home: HomeScreen(),
    );
  }
}