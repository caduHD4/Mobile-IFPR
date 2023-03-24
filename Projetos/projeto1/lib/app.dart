import 'package:flutter/material.dart';
import 'package:projeto1/home.dart';


class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'The best app of the world',
      home: Home(),
    ) ;
  }
}