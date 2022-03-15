// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home _$HomeFromJson(Map<String, dynamic> json) {
  return Home(
    category: json['category'] as String,
    imageURL: json['imageURL'] as String,
  );
}

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
      'category': instance.category,
      'imageURL': instance.imageURL,
    };
