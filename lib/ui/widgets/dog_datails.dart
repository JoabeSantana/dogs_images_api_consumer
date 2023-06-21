import 'package:dogs_images_api_consumer/datasources/remote/dog_helper.dart';
import 'package:dogs_images_api_consumer/models/dog.dart';
import 'package:flutter/material.dart';

class DogDetails extends StatelessWidget {
  const DogDetails({super.key, required this.dog, required this.helper});

  final Dog dog;

  final DogHelper helper;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Dog>(
      future: helper.getDogByID(dog.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error.toString()}');
        } else if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              Image.network(
                snapshot.data!.imageUrl,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  return loadingProgress == null
                      ? child
                      : const CircularProgressIndicator();
                },
              ),
              Text('lifeSpan: ${dog.breeds.first.lifeSpan}'),
              Text(dog.breeds.first.name),
              Text('temperament: ${dog.breeds.first.temperament}'),
              Text(dog.breeds.first.height.imperial),
              Text(dog.breeds.first.weight.imperial),
              Text('Bred For: ${dog.breeds.first.bredFor}'),
              Text('Bred Group: ${dog.breeds.first.breedGroup}'),
              Text('Bred ID: ${dog.breeds.first.id}'),
              Text('DOG ID: ${dog.id}')
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
