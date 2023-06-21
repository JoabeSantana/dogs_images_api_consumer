import 'dart:convert';
import 'package:dogs_images_api_consumer/models/dog.dart';
import 'package:http/http.dart' as http;

class DogHelper {

  Future<List<Dog>> listOfDogs = _listDogs();
  
  Future<List<Dog>> listDogs () {
    return _listDogs();
  }
  
  Future<Dog> getDogByID(String id){
    return _getDogById(id);
  }

}

Future<List<Dog>> _listDogs() async {
  final response = await http.get(
    headers: {
      'x-api-key':
          'live_dmpsGnerefTPjX2XGbKpxZ4zzHdefPoDZ5HPdoKi0qiQ5JtUfLtf6Py2xCCs4yxA'
    },
    Uri.parse('https://api.thedogapi.com/v1/images/search?size=thumb&has_breeds=true&limit=50'),
  );
  return _fetcDogsList(response.body);
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
  return _fetcDog(response.body);
}

Dog _fetcDog(String responseBody) {
  return Dog.fromJson(jsonDecode(responseBody));
}

List<Dog> _fetcDogsList(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return parsed.map<Dog>((json) => Dog.fromJson(json)).toList();
}
