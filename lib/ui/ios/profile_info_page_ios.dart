import 'package:dogs_images_api_consumer/constantes.dart';
import 'package:dogs_images_api_consumer/ui/widgets/bold_text.dart';
import 'package:dogs_images_api_consumer/ui/widgets/card_items_description.dart';
import 'package:dogs_images_api_consumer/ui/widgets/circular_asset_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileInfoPageIos extends StatelessWidget {
  const ProfileInfoPageIos({super.key});

  @override
  Widget build(BuildContext context) {
    const double circularImageHeight = 150;
    const double circularImagewidth = circularImageHeight;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          middle: Text(Constantes.titleNameProfilePage)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) {
                        return CupertinoPageScaffold(
                          navigationBar: const CupertinoNavigationBar(),
                          backgroundColor: Colors.black,
                          child:
                              Center(child: Image.asset('images/joabe.jpeg')),
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
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30, top: 25),
              child: Column(
                children: [
                  const CardItemsDescription(),
                  const Padding(padding: EdgeInsets.only(top: 25)),
                  CupertinoButton(
                      color: CupertinoColors.activeBlue,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info_outline),
                          Padding(padding: EdgeInsets.only(right: 5)),
                          Text('About this App'),
                        ],
                      ),
                      onPressed: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: const Text(Constantes.appName),
                            content: const Text('Version: ${Constantes.appVersion}\n${Constantes.appDescription}'),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('Close'),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
