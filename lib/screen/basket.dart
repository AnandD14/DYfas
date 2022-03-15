import 'package:flutter/material.dart';
import 'package:luga_fataa/Model/basket_manager.dart';
import 'package:provider/provider.dart';


import 'empty_basket_screen.dart';
import 'header.dart';

class Basket extends StatelessWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Header(size: size),
                  buildGroceryScreen()
                ]
            )
        )
    );
  }

  Widget buildGroceryScreen() {
    // 1
    return Consumer<BasketManager>(
      // 2
      builder: (context, manager, child) {
        // 3
        if (manager.productItems.isNotEmpty) {
          // TODO 25: Add GroceryListScreen
          return Container();
        } else {
          // 4
          return const EmptyBasketScreen();
        }
      },
    );
  }



}
