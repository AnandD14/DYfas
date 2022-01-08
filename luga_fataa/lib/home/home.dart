import 'package:flutter/material.dart';
import 'package:luga_fataa/components/bottom_nav_bar.dart';
import 'package:luga_fataa/components/custom_app_bar.dart';
import 'package:luga_fataa/constant.dart';
import 'package:luga_fataa/home/components/basket.dart';
import 'package:luga_fataa/home/components/favorite.dart';
import 'package:luga_fataa/home/components/user.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;


  static List<Widget> pages = <Widget>[
    const Body(),
    const Basket(),
    const Favorite(),
    const User()
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'DYFAS', backgroundColor: kSecondaryColor,
      ),
      body:  pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,

        currentIndex: _selectedIndex,
        // 11
        onTap: _onItemTapped,
        // TODO: Set selected tab bar
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Card',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: 'Card2',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Card3',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Card3',
          ),
        ],
      ),
    );
  }
}
