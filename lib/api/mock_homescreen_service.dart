import 'dart:convert';
import 'package:flutter/services.dart';
import '../Model/models.dart';


/*// 2
const String apiKey = '<Your Key Here>';
const String apiId = '<Your Id here>';
// 3
const String apiUrl = 'https://fakestoreapi.com';

// TODO: Add @ChopperApi() here
// 1
@ChopperApi()
// 2
abstract class ProductService extends ChopperService {
  // 3
  @Get(path: 'products')
  // 4
  Future<Response<Result<Product>>> queryRecipes(
      // 5
      @Query('id') int id, @Query('title') String label, @Query('price') double price,
      @Query('image') String imageUrl, @Query('description') String description);
// TODO: Add create()
  static ProductService create() {
    // 1
    final client = ChopperClient(
      // 2
      baseUrl: apiUrl,
      // 3
      interceptors: [_addQuery, HttpLoggingInterceptor()],
      // 4
      converter: ModelConverter(),
      // 5
      errorConverter: const JsonConverter(),
      // 6
      services: [
        _$ProductService(),
      ],
    );
    // 7
    return _$ProductService(client);
  }

}
Request _addQuery(Request req) {
  final params = Map<String, dynamic>.from(req.parameters);
 // params['app_id'] = apiId;
//  params['app_key'] = apiKey;

  return req.copyWith(parameters: params);
}*/

class MockService {

  // Get sample explore screen json to display in ui
  Future<List<Home>> getImageURLs() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString =
    await _loadAsset('assets/sample_data/home.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);
    /*final jsonString = await _loadAsset('assets/sample_data/home.json');
    Home? homeModel = null;

    homeModel = Home.fromJson(jsonDecode(jsonString));*/
    print("Home");

    // Go through each screen item and convert json to Home object.
    if (json['home'] != null) {
      final home = <Home>[];
      json['home'].forEach((v) {
        home.add(Home.fromJson(v));
      });
      return home;
    } else {
      return [];
    }
  }


  // Loads sample json data from file system
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
