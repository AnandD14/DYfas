import 'package:flutter/material.dart';
import 'package:luga_fataa/Category/category_detail.dart';
import 'package:luga_fataa/Model/home.dart';
import 'package:luga_fataa/Model/models.dart';
import 'package:luga_fataa/constant.dart';
import '';

class Category extends StatefulWidget {
  final List<Home> homeItems;
  const Category({
    Key? key,
    required this.size,
    required this.homeItems,
  }) : super(key: key);

  final Size size;

  @override
  _Category createState() => _Category();

}


class _Category extends State<Category> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: Column(
            children: widget.homeItems.map((homeItem) => categoryCard(homeItem.category,homeItem.imageURL,context)).toList()
        )
    );
  }

  Widget categoryCard(category, imageURL, context) {
    return Center(
        child: InkWell(
          child: Container(
            width: widget.size.width,
            height: widget.size.height * 0.3,
            child: Stack(
              children: [
                Positioned(
                  child: Text(
                      category,
                      style: Theme.of(context).textTheme.headline2
                  ),
                  top: 5,
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imageURL),
                  fit: BoxFit.cover,
                  colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.5),
                      BlendMode.dstATop)
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetail(title: category, backgroundColor: kSecondaryColor)));
          },
        )
    );

  }
}

