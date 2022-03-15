import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  int id;
  String title;
  double? price;
  String description;
  String category;
  String image;
  Map<String, dynamic> rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating
  });

}

@JsonSerializable()
class Ratings {

  factory Ratings.fromJson(Map<String, dynamic> json) =>
      _$RatingsFromJson(json);

  Map<String, dynamic> toJson() => _$RatingsToJson(this);


  double rate;
  int count;

  Ratings({
    required this.rate,
    required this.count,
  });


}
 /* Product copyWith({
    int? id,
    String? label,
    double? price,
    String? imageUrl,
    String? discount,
    int? size,
    String? description,
    bool? isComplete,

  }) {
    return Product(
      id: id ?? this.id,
      label: label ?? this.label,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      discount: discount ?? this.discount,
      size: size ?? this.size,
      description: description ?? this.description,
      isComplete: isComplete ?? this.isComplete,
    );
  }*/


