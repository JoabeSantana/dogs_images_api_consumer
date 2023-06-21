import 'package:dogs_images_api_consumer/models/height.dart';
import 'package:dogs_images_api_consumer/models/weight.dart';

class Breed {
  Weight weight;
  Height height;
  int id;
  String name;
  String? bredFor;
  String? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? referenceImageId;

  Breed({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    this.bredFor,
    this.breedGroup,
    this.lifeSpan,
    this.temperament,
    this.referenceImageId,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      weight: Weight.fromJson(json['weight']),
      height: Height.fromJson(json['height']),
      id: json['id'],
      name: json['name'],
      bredFor: json['bred_for'],
      breedGroup: json['breed_group'],
      lifeSpan: json['life_span'],
      temperament: json['temperament'],
      referenceImageId: json['reference_image_id'],
    );
  }
}