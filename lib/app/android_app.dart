import 'package:dogs_images_api_consumer/ui/android/home_page.dart';
import 'package:flutter/material.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme( backgroundColor: Colors.black),
        colorScheme: const ColorScheme.dark(), 
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
