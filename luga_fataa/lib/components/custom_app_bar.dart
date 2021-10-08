import 'package:flutter/material.dart';
import 'package:luga_fataa/constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;
  final Color backgroundColor;

  const CustomAppBar({Key? key,
  required this.title,
  required this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title: Text(title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            fontFamily: 'IndieFlower'
        ),
      ),
      backgroundColor: backgroundColor,
      elevation: 0.0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80.0);
}
