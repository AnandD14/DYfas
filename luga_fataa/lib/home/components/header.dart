import 'package:flutter/material.dart';
import 'package:luga_fataa/constant.dart';

class Header extends StatefulWidget {

  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _HeaderState createState() => _HeaderState(size);
}

class _HeaderState extends State<Header> {

  _HeaderState(
       this.size,
      );
  final Size size;
  var inputText = "";
  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Container(
      height: size.height * 0.1,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
            color: kSecondaryColor,// set border color
            )
          ),
           child: TextField(
              controller: _controller,
              maxLines: 1,
              style: TextStyle(fontSize: 17, fontFamily: 'SourceCodePro', color: kSecondaryColor,),
              textAlignVertical: TextAlignVertical.center,
              onChanged: (text) {
                setState(() {
                inputText = text;
                });
              },
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: kSecondaryColor),
                suffixIcon: hidingIcon(),
                fillColor: kBackgroundColor,
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontFamily: 'SourceCodePro',
                  color: kSecondaryColor,
                ),
              ),
           ),
        ),
      ),
    );
  }
  Widget hidingIcon() {

    if (inputText.length > 0) {
      return IconButton(
          icon: Icon(
            Icons.clear,
            color: kSecondaryColor,
          ),
          onPressed: () {
            setState(() {
              _controller.clear();
              inputText = "";
            });
          });
    }
    return SizedBox();
  }
}

