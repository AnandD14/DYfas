import 'package:chopper/chopper.dart';
import 'package:luga_fataa/network/model_converter.dart';
import '../Model/models.dart';
import 'package:luga_fataa/network/model_response.dart';
part 'product_service.chopper.dart';


// 2
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
  Future<Response<Result<Product>>> queryProducts(
      // 5string
      @Query('limit') int limit);
// TODO: Add create()
  static ProductService create() {
    // 1
    final client = ChopperClient(
      // 2
      baseUrl: apiUrl,
      // 3
     // interceptors: [_addQuery, HttpLoggingInterceptor()],
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
   // print(_$ProductService(client).toString());
    return _$ProductService(client);
  }

}
Request _addQuery(Request req) {
  final params = Map<String, dynamic>.from(req.parameters);
  // params['app_id'] = apiId;
//  params['app_key'] = apiKey;

  return req.copyWith(parameters: params);
}

