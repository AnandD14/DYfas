import 'package:flutter/material.dart';
import 'package:luga_fataa/components/custom_app_bar.dart';
import 'package:luga_fataa/constant.dart';
import 'package:luga_fataa/product/product_detail.dart';

class CategoryDetail extends StatefulWidget {

  final String title;
  final Color backgroundColor;

  const CategoryDetail({
    Key? key,
    required this.title,
    required this.backgroundColor
  }) : super(key: key);

  @override
  _CategoryDetailState createState() => _CategoryDetailState(title, backgroundColor);
}

class _CategoryDetailState extends State<CategoryDetail> {

  _CategoryDetailState(
      this.title,
      this.backgroundColor,
      );
  final String title;
  final Color backgroundColor;
  bool selected = false;
  var itemSelected = new List<bool>.filled(50, false, growable: false);



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: CustomAppBar(
            title:title,
            backgroundColor: backgroundColor
        ),
        body: GridView.builder(
            itemCount: 50,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SizedBox(
             //   height: size.height * 0.2,
                child: InkWell(
                  child: Card(
                      color: kBackgroundColor,
                      child: Column(
                          children: <Widget> [
                           /* Align(
                              alignment: Alignment.center,
                              child: Text('AD',
                                  style:TextStyle(
                                    fontFamily: 'SourceCodePro',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: kSecondaryColor,
                                  )
                              ),
                            ),*/
                            Expanded(
                              child: Hero(
                                tag:'product_image_$index',
                                child: FittedBox(
                                  fit: BoxFit.contain, // otherwise the logo will be tiny
                                  child: FlutterLogo(),
                                ),
                              )
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text('AD',
                                        style:TextStyle(
                                          fontFamily: 'SourceCodePro',
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: kSecondaryColor,
                                        )
                                    ),
                                    Text('\$100',
                                        style:TextStyle(
                                          fontFamily: 'SourceCodePro',
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: kSecondaryColor,
                                        )
                                    ),
                                  ],
                                ),
                                selectedIcon(index)
                              ],
                            )
                          ]
                      )
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(index:index)));
                  },
                )
            );
          }),
        ),

      );
  }

  Widget selectedIcon(index){
      return IconButton(
          onPressed: (){
            setState(() {
              itemSelected[index] = !itemSelected[index];
            });
          },

          icon: Icon(itemSelected[index] ? Icons.favorite : Icons.favorite_outline)
      );
    }
}
