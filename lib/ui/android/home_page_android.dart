import 'package:dogs_images_api_consumer/constantes.dart';
import 'package:dogs_images_api_consumer/datasources/remote/dog_helper.dart';
import 'package:dogs_images_api_consumer/models/breed.dart';
import 'package:dogs_images_api_consumer/models/dog.dart';
import 'package:dogs_images_api_consumer/ui/android/profile_info_page_android.dart';
import 'package:dogs_images_api_consumer/ui/widgets/dog_image_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageAndroid extends StatefulWidget {
  const HomePageAndroid({super.key});

  @override
  State<HomePageAndroid> createState() => _HomePageAndroidState();
}

class _HomePageAndroidState extends State<HomePageAndroid> {
  int qtdeImagesGrid = 3;
  var listView = false;

  DogHelper helper = DogHelper();
  int dropDownSizeValue = 20;

  late Future<List<Dog>> dogsList;
  
  Breed? dropDownBreedValue;
  List<int> sizeValues = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

  Future refresh() async {
    setState(() {
      dogsList = helper.listDogs(dropDownSizeValue);
      dropDownBreedValue = null;
    });
  }

  @override
  void initState() {
    super.initState();
    dogsList = helper.listDogs(dropDownSizeValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constantes.appName),
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
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const ProfileInfoPageAndroid();
                },
              ));
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 5, right: 15),
              child: Icon(Icons.info_outline),
            ),
          ),
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
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FutureBuilder<List<Breed>>(
                future: helper.listOfBreeds,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error.toString()}');
                  } else if (snapshot.hasData) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      dropDownBreedValue ??= snapshot.data!.first;
                      return DropdownButton<Breed>(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        hint: const Text('Breeds'),
                        value: dropDownBreedValue,
                        items: snapshot.data!.map<DropdownMenuItem<Breed>>(
                          (Breed value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value.name),
                            );
                          },
                        ).toList(),
                        onChanged: (Breed? value) {
                          setState(() {
                            dropDownBreedValue = value;
                            dogsList = helper.listDogsByID(
                                value!.id, dropDownSizeValue);
                          });
                        },
                      );
                    }
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              DropdownButton<int>(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                icon: const Icon(Icons.keyboard_arrow_down),
                hint: const Text('Breeds'),
                value: dropDownSizeValue,
                items: sizeValues.map<DropdownMenuItem<int>>(
                  (int value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value.toString()),
                    );
                  },
                ).toList(),
                onChanged: (int? value) {
                  setState(() {
                    dropDownSizeValue = value!;
                    dogsList = helper.listDogsByID(dropDownBreedValue!.id, value);
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: refresh,
              child: FutureBuilder<List<Dog>>(
                future: dogsList,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error.toString()}');
                  } else if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    return DogImageList(
                      dogs: snapshot.data!,
                      qtdeImagesGrid: qtdeImagesGrid,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
