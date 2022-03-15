import 'package:json_annotation/json_annotation.dart';

part 'home.g.dart';

@JsonSerializable()
class Home {
  factory Home.fromJson(Map<String, dynamic> json) =>
      _$HomeFromJson(json);

  Map<String, dynamic> toJson() => _$HomeToJson(this);

  @JsonKey(name: 'category')
  String category;
  String imageURL;


  Home({
    required this.category,
    required this.imageURL,
  });

}

