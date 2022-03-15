import 'dart:math';

import 'package:flutter/material.dart';
import 'package:luga_fataa/components/custom_app_bar.dart';
import 'package:luga_fataa/constant.dart';
import 'package:luga_fataa/product/product_detail.dart';
import 'package:chopper/chopper.dart';
import '../../network/model_response.dart';
import 'dart:collection';
import '../api/apis.dart';
import '../Model/models.dart';


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

  final ScrollController _scrollController = ScrollController();
  int currentCount = 0;
  int currentStartPosition = 0;
  int currentEndPosition = 20;
  int pageCount = 20;
  bool hasMore = false;
  bool loading = false;
  bool inErrorState = false;

  @override
  void initState() {
    super.initState();
    (
        _scrollController
          ..addListener(() {
            final triggerFetchMoreSize =
                0.7 * _scrollController.position.maxScrollExtent;

            if (_scrollController.position.pixels > triggerFetchMoreSize) {
              if (hasMore &&
                  currentEndPosition < currentCount &&
                  !loading &&
                  !inErrorState) {
                setState(() {
                  loading = true;
                  currentStartPosition = currentEndPosition;
                  currentEndPosition =
                      min(currentStartPosition + pageCount, currentCount);
                });
              }
            }
          })
    );
    }

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
    return _buildRecipeLoader(context);
  }

  Widget buildProductList(BuildContext context, List<Product> products){
    final size = MediaQuery.of(context).size;
    const itemHeight = 310;
    final itemWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title:title,
        ),
        body: SingleChildScrollView(
          child: GridView.builder(
            controller: _scrollController,
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (itemWidth / itemHeight),
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SizedBox(
                  //   height: size.height * 0.2,
                      child: Card(
                          child: Column(
                              children: <Widget> [
                                Expanded(
                                    child: InkWell(
                                      child: Hero(
                                        tag:'product_image_$index',
                                        child:  Image.network(
                                        products[index].image,
                                        fit: BoxFit.fill,
                                        loadingBuilder: (BuildContext context, Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress.expectedTotalBytes != null
                                                  ? loadingProgress.cumulativeBytesLoaded /
                                                  loadingProgress.expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(index:index)));
                                        },
                                    )
                                ),
                                Text(products[index].title,
                                    style: Theme.of(context).textTheme.bodyText1
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(products[index].price.toString(),
                                            style:Theme.of(context).textTheme.bodyText1
                                        ),
                                        selectedIcon(index)

                                      ],
                                    ),

                                  ],
                                ),
                              ]
                          )
                      )
                    );

              }),
        ),
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

  Widget _buildRecipeLoader(BuildContext context) {

    return FutureBuilder<Response<Result<Product>>>(
      future: ProductService.create().queryProducts(pageCount),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString()+"   hii",
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }

          loading = false;
          // Hit an error
          if (false == snapshot.data?.isSuccessful) {
            var errorMessage = 'Problems getting data';
            if (snapshot.data?.error != null &&
                snapshot.data?.error is LinkedHashMap) {
              final map = snapshot.data?.error as LinkedHashMap;
              errorMessage = map['message'];
            }
            return Center(
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18.0),
              ),
            );
          }
          final result = snapshot.data?.body;
          print(result);
          final query = (result as Success).value;
          if (result == null || result is Error) {
            inErrorState = true;
            return buildProductList(context,query as List<Product>);
          }
          /*final query = (result as Success).value;
          inErrorState = false;
          currentCount = query.count;
          hasMore = query.more;
          if (query.to < currentEndPosition) {
            currentEndPosition = query.to;
          }*/


          return buildProductList(context,query as List<Product>);
        } else {
          // Show a loading indicator while waiting for the movies
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

/*  Widget _buildRecipeList(BuildContext recipeListContext) {
    final size = MediaQuery.of(context).size;
    const itemHeight = 310;
    final itemWidth = size.width / 2;
    return Flexible(
      child: GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemCount: hits.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildRecipeCard(recipeListContext, hits, index);
        },
      ),
    );
  }

  Widget _buildRecipeCard(
      BuildContext topLevelContext, List<APIHits> hits, int index) {
    final recipe = hits[index].recipe;
    return GestureDetector(
      onTap: () {
        Navigator.push(topLevelContext, MaterialPageRoute(
          builder: (context) {
            return const RecipeDetails();
          },
        ));
      },
      child: recipeCard(recipe),
    );
  }*/
}
