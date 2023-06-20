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
  var qtdeImagesGrid = 3;
  var listView = false;
  DogImageHelper helper = DogImageHelper();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Image.asset('images/dog-api-logo.png',
            color: Colors.white, width: 25),
        middle: const Text(Constantes.nomeApp),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  qtdeImagesGrid = qtdeImagesGrid == 3 ? 1 : 3;
                  listView = !listView;
                });
              },
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
            const Padding(
              padding: EdgeInsets.all(5),
              child: SizedBox(),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  helper = DogImageHelper();
                });
              },
              child: const Icon(
                CupertinoIcons.refresh,
                color: Colors.white,
                size: 25,
              ),
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: FutureBuilder<List<Dog>>(
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
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
          },
        ),
      ),
    );
  }
}
