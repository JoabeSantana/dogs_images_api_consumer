import 'package:dogs_images_api_consumer/ui/ios/home_page_ios.dart';
import 'package:flutter/cupertino.dart';

class IosApp extends StatelessWidget {
  const IosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomePageIos(),
      theme: CupertinoThemeData(
          barBackgroundColor: CupertinoColors.black,
          scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray),
    );
  }
}
