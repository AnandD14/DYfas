import 'package:flutter/material.dart';
import 'package:luga_fataa/components/bottom_nav_bar.dart';
import 'package:luga_fataa/components/custom_app_bar.dart';
import 'package:luga_fataa/constant.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'LNF', backgroundColor: kSecondaryColor,
      ),
      body: Body(),
      bottomNavigationBar: BottomNavBar(size:size),
    );
  }
}
