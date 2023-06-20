import 'package:dogs_images_api_consumer/constantes.dart';
import 'package:dogs_images_api_consumer/datasources/remote/dog_image_helper.dart';
import 'package:dogs_images_api_consumer/models/dog.dart';
import 'package:dogs_images_api_consumer/ui/widgets/dog_image_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int qtdeImagesGrid = 3;
  var listView = false;
  DogImageHelper helper = DogImageHelper();
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constantes.nomeApp),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                'images/dog-api-logo.png',
                color: Colors.white,
              ),
            );
          },
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
                setState(() {
                  qtdeImagesGrid = qtdeImagesGrid == 3 ? 1 : 3;
                  listView = !listView;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 5, right: 15),
                child: listView
                    ? const Icon(
                        CupertinoIcons.square_grid_2x2,
                        color: Colors.white,
                        size: 25,
                      )
                    : const Icon(
                        CupertinoIcons.list_bullet,
                        color: Colors.white,
                        size: 25,
                      ),
              ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                helper = DogImageHelper();
              });
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 5, right: 15),
              child: Icon(CupertinoIcons.refresh),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Dog>>(
        future: helper.listar,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error.toString()}');
          } else if (snapshot.hasData) {
            return DogImageList(
              images: snapshot.data!,
              qtdeImagesGrid: qtdeImagesGrid,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
