import 'dart:collection';
import 'dart:convert';
import 'package:chopper/chopper.dart';

import 'model_response.dart';
import '../Model/models.dart';

class ModelConverter implements Converter {

  List<Product> listProduct = [];

  @override
  Request convertRequest(Request request) {
    final req = applyHeader(
      request,
      contentTypeKey,
      jsonHeaders,
      override: false,
    );

    return encodeJson(req);
  }

  Request encodeJson(Request request) {
    final contentType = request.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      return request.copyWith(body: json.encode(request.body));
    }
    return request;
  }

  Response<BodyType> decodeJson<BodyType, InnerType>(Response response) {
    final contentType = response.headers[contentTypeKey];
    var body = response.body;
   // print(contentType?.contains(jsonHeaders).toString());
    if (contentType != null && contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
    }
    try {
      final mapData =  json.decode(body);
    //  final Map<String,dynamic> map = Map.from(mapData[0]);
     // final productQuery =  Product.fromJson(mapData[0] as Map<String,dynamic>);

      for(final e in mapData){
        //
        listProduct.add(Product.fromJson(e as Map<String, dynamic>));
      }
      // print(mapData['status'].toString());
      /*if (mapData['status'] != null) {
        return response.copyWith<BodyType>(
            body: Error(Exception(mapData['status'])) as BodyType);
      }*/

    //  final Map<String, dynamic> mapData = new Map<String, dynamic>.from( json.decode(response.body));
     // print(newMapData['id']);
   /*  for(Map i in mapData[0]){
       listProduct.add(Product.fromJson(i as Map<String,dynamic>));
     }*/
     // final productQuery =  mapData[0].map((e) => Product.fromJson(e as Map<String, dynamic>)).toList();
    //  print(productQuery.toString());
      return response.copyWith<BodyType>(
          body: Success(listProduct) as BodyType);
    } catch (e) {
      chopperLogger.warning(e);
      return response.copyWith<BodyType>(
          body: Error(e as Exception) as BodyType);
    }
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return decodeJson<BodyType, InnerType>(response);
  }
}
