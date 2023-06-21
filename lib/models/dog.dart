import 'package:dogs_images_api_consumer/models/breed.dart';

class Dog {
  List<Breed> breeds;
  String id;
  String imageUrl;
  int width;
  int height;

  Dog(
      {required this.breeds,
      required this.id,
      required this.imageUrl,
      required this.width,
      required this.height});

  factory Dog.fromJson(Map<String, dynamic> json) {
    var breed = <Breed>[];
    json['breeds'].forEach((v) {
      breed.add(Breed.fromJson(v));
    });

    return Dog(
      breeds: breed,
      id: json['id'],
      imageUrl: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }

  Breed firstBreedFromList() {
    return breeds.first;
  }
}