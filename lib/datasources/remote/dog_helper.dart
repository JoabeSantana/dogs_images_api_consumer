import 'dart:convert';
import 'package:dogs_images_api_consumer/models/breed.dart';
import 'package:dogs_images_api_consumer/models/dog.dart';
import 'package:dogs_images_api_consumer/models/height.dart';
import 'package:dogs_images_api_consumer/models/weight.dart';
import 'package:http/http.dart' as http;

class DogHelper {
  
  //late Future<List<Dog>> listOfDogs;

  Future<List<Breed>> listOfBreeds = _listAllDogsBreeds();

  Future<List<Dog>> listDogsByID(int id, int listSize) {
    return _listDogsByID(id, listSize);
  }

  Future<List<Dog>> listDogs(int sizeList) {
    return _listDogs(sizeList);
  }

  Future<Dog> getDogByID(String id) {
    return _getDogById(id);
  }
}

Future<List<Dog>> _listDogsByID(int id, int listSize) async {
  StringBuffer url = StringBuffer();
  url.write(
      'https://api.thedogapi.com/v1/images/search?size=thumb&has_breeds=true');
  
  url.write('&limit=$listSize');
  
  if (id > 0) {
    url.write('&breed_ids=${id.toString()}');
  }

  final response = await http.get(
    headers: {
      'x-api-key':
          'live_dmpsGnerefTPjX2XGbKpxZ4zzHdefPoDZ5HPdoKi0qiQ5JtUfLtf6Py2xCCs4yxA'
    },
    Uri.parse(url.toString()),
  );
  return _fetchDogsList(response.body);
}

Future<List<Dog>> _listDogs(int sizeList) async {
  final response = await http.get(
    headers: {
      'x-api-key':
          'live_dmpsGnerefTPjX2XGbKpxZ4zzHdefPoDZ5HPdoKi0qiQ5JtUfLtf6Py2xCCs4yxA'
    },
    Uri.parse(
        'https://api.thedogapi.com/v1/images/search?size=thumb&has_breeds=true&limit=${sizeList}'),
  );
  return _fetchDogsList(response.body);
}

Future<List<Breed>> _listAllDogsBreeds() async {
  final response = await http.get(
    headers: {
      'x-api-key':
          'live_dmpsGnerefTPjX2XGbKpxZ4zzHdefPoDZ5HPdoKi0qiQ5JtUfLtf6Py2xCCs4yxA'
    },
    Uri.parse('https://api.thedogapi.com/v1/breeds'),
  );
  return _fetchAllDogsBreeds(response.body);
}

List<Breed> _fetchAllDogsBreeds(String responseBody) {
  final parsed = jsonDecode(responseBody);
  List<Breed> breeds = [
    Breed(
        weight: Weight(imperial: '', metric: ''),
        height: Height(imperial: '', metric: ''),
        id: 0,
        name: 'All')
  ];
  breeds.addAll(parsed.map<Breed>((json) => Breed.fromJson(json)).toList());
  return breeds;
}

Future<Dog> _getDogById(String imageId) async {
  final response = await http.get(
    headers: {
      'x-api-key':
          'live_dmpsGnerefTPjX2XGbKpxZ4zzHdefPoDZ5HPdoKi0qiQ5JtUfLtf6Py2xCCs4yxA'
    },
    //Uri.parse('https://api.thedogapi.com/v1/images/search?size=thumb&has_breeds=true&limit=50'),
    Uri.parse('https://api.thedogapi.com/v1/images/$imageId'),
  );
  return _fetchDog(response.body);
}

Dog _fetchDog(String responseBody) {
  return Dog.fromJson(jsonDecode(responseBody));
}

List<Dog> _fetchDogsList(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return parsed.map<Dog>((json) => Dog.fromJson(json)).toList();
}
