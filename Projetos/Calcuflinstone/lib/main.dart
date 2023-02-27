import 'package:calcuflinstone/pages/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leo do flutter',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),


      themeMode: ThemeMode.dark,

      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.dark()
      ),


      home: Home(),
    );
  }
}





