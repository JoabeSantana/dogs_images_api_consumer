import 'package:dogs_images_api_consumer/constantes.dart';
import 'package:dogs_images_api_consumer/ui/widgets/bold_text.dart';
import 'package:dogs_images_api_consumer/ui/widgets/card_items_description.dart';
import 'package:dogs_images_api_consumer/ui/widgets/circular_asset_image.dart';
import 'package:flutter/material.dart';

class ProfileInfoPageAndroid extends StatelessWidget {
  const ProfileInfoPageAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    const double circularImageHeight = 150;
    const double circularImagewidth = circularImageHeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constantes.titleNameProfilePage),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(),
                          backgroundColor: Colors.black,
                          body: Center(child: Image.asset('images/joabe.jpeg')),
                        );
                      },
                    ));
                  },
                  child: const CircularAssetImage(
                    assetName: 'images/joabe.jpeg',
                    height: circularImageHeight,
                    width: circularImagewidth,
                  ),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            const BoldText(
              text: Constantes.studentName,
              fontSize: 20,
              color: Colors.white70,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 30, left: 30, top: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CardItemsDescription(),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 205,
                          child: AboutListTile(
                            icon: Icon(Icons.info_outline),
                            applicationVersion: Constantes.appVersion,
                            applicationName: Constantes.appName,
                            aboutBoxChildren: [
                              Text(Constantes.appDescription),
                            ],
                            child: Text('About this App'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
