import 'package:flutter/material.dart';
import 'package:luga_fataa/home/components/category.dart';

import 'header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: <Widget>[
          Header(size: size),
          Category(size: size),
          ]
        )
        )
    );
  }
}
