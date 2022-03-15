// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ProductService extends ProductService {
  _$ProductService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ProductService;

  @override
  Future<Response<Result<Product>>> queryProducts(int limit) {
    final $url = 'products';
    final $params = <String, dynamic>{'limit': limit};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Result<Product>, Product>($request);
  }
}
