import 'package:flutter/material.dart';
import 'package:luga_fataa/constant.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    Key? key,
    required this.index
  }) : super(key: key);

  final int index;

  @override
  _ProductDetailState createState() => _ProductDetailState(index);
}

class _ProductDetailState extends State<ProductDetail> {

  _ProductDetailState(
      this.index,
      );
  final int index;
  Size? size = null;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold (
      body: Column(
        children : [
          Hero(
            tag:'product_image_$index',
            child: Container(
              height: size!.height * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/lehenga.jpg"),
                      fit: BoxFit.cover
                  )
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton( icon: Icon(Icons.arrow_back, color: kBackgroundColor,), onPressed: (){},),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton( icon: Icon(Icons.shopping_basket_outlined, color: kBackgroundColor), onPressed: (){},),
                  ),
                ]
              )
            )
          ),

      ]
    )
    )
    );
  }
}
