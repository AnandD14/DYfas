import 'package:flutter/material.dart';
import 'header.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Header(size: size),
                  Text('This is Favorite')
                ]
            )
        )
    );
  }
}
