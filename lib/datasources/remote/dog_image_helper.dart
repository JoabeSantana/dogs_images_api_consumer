import 'dart:convert';
import 'package:dogs_images_api_consumer/models/dog.dart';
import 'package:http/http.dart' as http;

class DogImageHelper {
  Future<List<Dog>> listar = _getList();
}

Future<List<Dog>> _getList () async {
  final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random/50'));
  return _fetchImagesList(response.body);
}

List<Dog> _fetchImagesList (String responseBody) {
  
  List<dynamic> urlList = jsonDecode(responseBody)['message'];
  
  List<Dog> images = [];
  
  for(var i = 0; i < urlList.length; i++){
    images.add(Dog(image: urlList[i]));
  }

  return images;
}