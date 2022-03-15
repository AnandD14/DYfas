import 'package:flutter/material.dart';
import 'package:luga_fataa/Model/app_state_manager.dart';
import 'package:luga_fataa/Model/dyfas_pages.dart';
import 'package:luga_fataa/components/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'body.dart';
import 'basket.dart';
import 'favorite.dart';
import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {

  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: DyFasPages.home,
      key: ValueKey(DyFasPages.home),
      child: HomeScreen(
        currentTab: currentTab,
      ),
    );
  }

  const HomeScreen({
    Key? key,
    required this.currentTab,
  }
  ) : super(key: key);

  final int currentTab;


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static List<Widget> pages = <Widget>[
    const Body(),
    const Basket(),
    const Favorite(),
    const UserScreen()
  ];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Consumer<AppStateManager>(builder: (context, appStateManager, child) {
      return Scaffold(
        appBar: CustomAppBar(
          title: 'DYFAS',
        ),
        body: IndexedStack(index: widget.currentTab, children:pages),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme
              .of(context)
              .textSelectionTheme
              .selectionColor,
          currentIndex:  widget.currentTab,
            onTap: (index) {
              // TODO: Update user's selected tab
              Provider.of<AppStateManager>(context, listen: false)
                  .goToTab(index);

            },
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined),
              label: 'Basket',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favorite',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'User',
            ),
          ],
        ),
      );
    }
    );
  }
}
