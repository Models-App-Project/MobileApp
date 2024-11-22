import 'package:flutter_application_1/data/Models/photos_model.dart';
import 'package:flutter_application_1/data/Models/request_model.dart';

class ModelModel {
  final String id;
  final String name;
  final int age;
  final String description;
  final String eyesColor;
  final String hairColor;
  final double height;
  final double weight;
  final double waistline;
  final double hip;
  final double bust;
  final RequestModel request;
  final List<PhotosModel> photos;

  ModelModel({
    required this.id,
    required this.name,
    required this.age,
    required this.description,
    required this.eyesColor,
    required this.hairColor,
    required this.height,
    required this.weight,
    required this.waistline,
    required this.hip,
    required this.bust,
    required this.request,
    required this.photos,
  });

  factory ModelModel.fromMap(Map<String, dynamic> map) {
    return ModelModel(
      id: map['id'],
      name: map['name'],
      age: map['age'],
      description: map['description'],
      eyesColor: map['eyesColor'],
      hairColor: map['hairColor'],
      height: map['height'],
      weight: map['weight'],
      waistline: map['waistline'],
      hip: map['hip'],
      bust: map['bust'],
      request: RequestModel.fromMap(map['request']),
      photos: (map['photos'] as List)
          .map((photo) => PhotosModel.fromMap(photo))
          .toList(),
    );
  }
}