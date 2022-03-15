import 'package:flutter/material.dart';
import 'package:luga_fataa/Category/category_detail.dart';
import 'package:luga_fataa/constant.dart';

class Category extends StatelessWidget {

  const Category({
        Key? key,
        required this.size,
      }) : super(key: key);

  final Size size;


  @override
  Widget build(BuildContext context) {

    List<String> category = ['TRENDING','LEHENGAS','KURTAS','GOWNS','SARIS'];

    return SingleChildScrollView(
      child: Column(
        children: category.map((category) => categoryCard(category,context)).toList()
      )
    );
  }

  Widget categoryCard(category, context) {
    return SizedBox(
        height: size.height * 0.2,
        child: InkWell(
          child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: kSecondaryColor,
              child: Column(
                children: <Widget> [
                  Align(
                    alignment: Alignment.center,
                    child: Text(category,
                    style:TextStyle(
                      fontFamily: 'SourceCodePro',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: kBackgroundColor,
                    )
                 ),
               ),
                Expanded(
                child: FittedBox(
                  fit: BoxFit.contain, // otherwise the logo will be tiny
                  child: FlutterLogo(),
                ),
              ),
            ]
        )
        ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetail(title: category, backgroundColor: kSecondaryColor)));
          },
    )
    );


  }
}

