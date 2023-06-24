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
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  return loadingProgress == null
                      ? child
                      : const CircularProgressIndicator();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Height'),
                            Text(
                              dog.breeds.first.height.imperial,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Padding(padding: EdgeInsets.all(5)),
                            const Text('Bred Group'),
                            Text(
                              '${dog.breeds.first.breedGroup}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Weight'),
                            Text(dog.breeds.first.weight.imperial,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Life Span'),
                            Text('${dog.breeds.first.lifeSpan}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))
                          ],
                        )
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10)),
                    const Text('Sumary',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 10)),
                    Text(
                        'A dog of a temperament ${dog.breeds.first.temperament?.toLowerCase()} of a breed for ${dog.breeds.first.bredFor?.toLowerCase()}.')
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
