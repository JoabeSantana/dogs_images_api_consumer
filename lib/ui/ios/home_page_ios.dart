import 'package:dogs_images_api_consumer/constantes.dart';
import 'package:dogs_images_api_consumer/datasources/remote/dog_helper.dart';
import 'package:dogs_images_api_consumer/models/breed.dart';
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
  final int sizeList = 20;

  DogHelper helper = DogHelper();

  late Future<List<Dog>> dogsList;

  final double _kItemExtent = 32.0;

  int _selectedBreed = 0;
  int _selectedSize = 1;

  Breed? dropDownBreedValue;
  List<int> sizeValues = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

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
                  helper = DogHelper();
                  dogsList = helper.listDogs(sizeList);
                  _selectedSize = 1;
                  _selectedBreed = 0;
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureBuilder<List<Breed>>(
                  future: helper.listOfBreeds,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error.toString()}');
                    } else if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done) {
                      dropDownBreedValue ??= snapshot.data!.first;
                      return SizedBox(
                        width: MediaQuery.of(context).size.width - 105,
                        child: CupertinoButton(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                              'Breed: ${snapshot.data![_selectedBreed].name}',
                              maxLines: 1),
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => Container(
                                height: 500,
                                padding: const EdgeInsets.only(top: 6.0),
                                margin: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                color: CupertinoColors.systemBackground
                                    .resolveFrom(context),
                                child: SafeArea(
                                  top: false,
                                  child: CupertinoPicker(
                                    magnification: 1.22,
                                    squeeze: 1.2,
                                    useMagnifier: true,
                                    itemExtent: _kItemExtent,
                                    scrollController:
                                        FixedExtentScrollController(
                                      initialItem: _selectedBreed,
                                    ),
                                    onSelectedItemChanged: (int selectedItem) {
                                      setState(() {
                                        _selectedBreed = selectedItem;
                                        dropDownBreedValue =
                                            snapshot.data![selectedItem];
                                        dogsList = helper.listDogsByID(
                                            snapshot.data![selectedItem].id,
                                            sizeValues[_selectedSize]);
                                      });
                                    },
                                    children: List<Widget>.generate(
                                      snapshot.data!.length,
                                      (int index) {
                                        return Center(
                                          child:
                                              Text(snapshot.data![index].name),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return const Center(
                      child: CupertinoActivityIndicator(color: Colors.white),
                    );
                  },
                ),
                SizedBox(
                  width: 105,
                  child: CupertinoButton(
                    child:
                        Text('Size: ${sizeValues[_selectedSize].toString()}'),
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                          height: 200,
                          padding: const EdgeInsets.only(top: 6.0),
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          color: CupertinoColors.systemBackground
                              .resolveFrom(context),
                          child: SafeArea(
                            top: false,
                            child: CupertinoPicker(
                              magnification: 1.22,
                              squeeze: 1.2,
                              useMagnifier: true,
                              itemExtent: _kItemExtent,
                              scrollController: FixedExtentScrollController(
                                initialItem: _selectedSize,
                              ),
                              onSelectedItemChanged: (int selectedItem) {
                                setState(() {
                                  _selectedSize = selectedItem;
                                  dogsList = helper.listDogsByID(
                                      dropDownBreedValue!.id,
                                      sizeValues[_selectedSize]);
                                });
                              },
                              children: List<Widget>.generate(
                                sizeValues.length,
                                (int index) {
                                  return Center(
                                    child: Text(sizeValues[index].toString()),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
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
