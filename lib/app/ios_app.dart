import 'package:dogs_images_api_consumer/ui/ios/home_page.dart';
import 'package:flutter/cupertino.dart';

class IosApp extends StatelessWidget {
  const IosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: CupertinoThemeData(
          barBackgroundColor: CupertinoColors.black,
          scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray),
    );
  }
}
