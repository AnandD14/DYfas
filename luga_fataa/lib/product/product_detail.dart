import 'package:flutter/material.dart';

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
    print(size!.height* 0.5);

    return SafeArea(
      child: Hero(
          tag:'product_image_$index',
          child: Container(
          height: size!.height * 0.5,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
                  ),
                  fit: BoxFit.cover
              )
          ),
        )
      )
    );
  }
}
