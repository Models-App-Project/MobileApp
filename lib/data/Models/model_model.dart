import 'package:uuid/uuid.dart';

class ModelModel {
  final Uuid id;
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
  final List<String> url;

  ModelModel( 
      {required this.id,
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
      required this.url});

  factory ModelModel.fromMap(Map<String, dynamic> map) {
    return ModelModel(
        id: map['id'],
        name: map['name'],
        age: map['age'],
        description: map['description'],
        eyesColor: map['eyesColor'],
        hairColor: map['hairColor'],
        height: map['height'] * 1.0,
        weight: map['weight'] * 1.0,
        waistline: map['waistline'] * 1.0,
        hip: map['hip'] * 1.0,
        bust: map['bust'] * 1.0, 
        url: map['url']);
  }
}
