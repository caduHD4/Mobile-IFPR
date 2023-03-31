import 'package:flutter/material.dart';
import 'package:flutter_application_4/classes/Cadastro.dart';
import 'package:flutter_application_4/classes/Detalhes.dart';
import 'package:flutter_application_4/classes/Home.dart';
import 'package:flutter_application_4/classes/Introducao.dart';
import 'package:flutter_application_4/classes/Lista.dart';
import 'package:flutter_application_4/classes/Login.dart';

class App extends StatelessWidget {
  const App({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The best app of the world',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/' : (context) => Introducao(),
        'login' : (context) => Login(),
        'home': (context) => Home(),
        'cadastro': (context) => Cadastro(),
        'lista': (context) => Lista(),
        'detalhes': (context) => Detalhes(),
      }
    );
  }
}
