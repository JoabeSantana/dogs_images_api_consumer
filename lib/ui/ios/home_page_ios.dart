import 'package:dogs_images_api_consumer/constantes.dart';
import 'package:dogs_images_api_consumer/datasources/remote/dog_helper.dart';
import 'package:dogs_images_api_consumer/models/dog.dart';
import 'package:dogs_images_api_consumer/ui/widgets/dog_image_list.dart';
import 'package:dogs_images_api_consumer/ui/ios/profile_info_page_ios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageIos extends StatefulWidget {
  const HomePageIos({super.key});
  
  @override
  State<HomePageIos> createState() => _HomePageIosState();
}

class _HomePageIosState extends State<HomePageIos> {
  var qtdeImagesGrid = 3;
  var listView = false;
  final int sizeList = 50;

  DogHelper helper = DogHelper();

  late Future<List<Dog>> dogsList;

  @override
  void initState() {
    super.initState();
    dogsList = helper.listDogs(sizeList);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Image.asset('images/dog-api-logo.png',
            color: Colors.white, width: 25),
        middle: const Text(Constantes.appName),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) {
                    return const ProfileInfoPageIos();
                  },
                ));
              },
              child: const Icon(
                CupertinoIcons.info,
                size: 25,
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5),
              child: SizedBox(),
            ),
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
                  dogsList = helper.listDogs(sizeList);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<Dog>>(
              future: dogsList,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error.toString()}');
                } else if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Expanded(
                    child: DogImageList(
                      dogs: snapshot.data!,
                      qtdeImagesGrid: qtdeImagesGrid,
                    ),
                  );
                } else {
                  return const Center(
                    child: CupertinoActivityIndicator(color: Colors.white),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
