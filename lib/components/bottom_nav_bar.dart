import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luga_fataa/constant.dart';

class BottomNavBar extends StatefulWidget {
  final Size size;

  const BottomNavBar({Key? key,
    required this.size,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState(size);
}

class _BottomNavBarState extends State<BottomNavBar> {
   int counter = 1;
  _BottomNavBarState(
      this.size,
      );
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 5.0,
        child: Container(
          color: kSecondaryColor,
          height: size.height * 0.07,
        /*  decoration: BoxDecoration(
              border: Border(
              top: BorderSide(color: kSecondaryColor,)
              ,// set border color
              )
          ),*/
          child: Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/screen.svg")),
                Stack(
                  children: <Widget>[
                    IconButton(icon: SvgPicture.asset("assets/icons/briefcase.svg"), onPressed: () {
                      setState(() {
                        counter = 0;
                      });
                    }),
                    counter != 0 ? Positioned(
                      right: 5,
                      top: 10,
                      child: Container(
                        //padding: EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '$counter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ) :  SizedBox()
                  ],
                ),
                Stack(
                  children: <Widget>[
                    IconButton(icon: SvgPicture.asset("assets/icons/heart.svg"), onPressed: () {
                      setState(() {
                        counter = 0;
                      });
                    }),
                    counter != 0 ? Positioned(
                      right: 5,
                      top: 10,
                      child: Container(
                        //padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '$counter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ) : SizedBox()
                  ],
                ),
                Stack(
                  children: <Widget>[
                    IconButton(icon: SvgPicture.asset("assets/icons/user.svg"), onPressed: () {
                      setState(() {
                        counter = 0;
                      });
                    }),
                    counter != 0 ? Positioned(
                      right: 5,
                      top: 10,
                      child: Container(
                        //padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '$counter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ) : SizedBox()
                  ],
                ),
              ],
            )
          ),
       )
    );
  }
}
