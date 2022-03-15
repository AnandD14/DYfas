import 'package:flutter/material.dart';
import 'header.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Header(size: size),
                  Text('This is User')
                ]
            )
        )
    );
  }
}
