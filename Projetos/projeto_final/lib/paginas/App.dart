import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/Cadastro.dart';
import 'package:projeto_final/paginas/Detalhes.dart';
import 'package:projeto_final/paginas/Home.dart';
import 'package:projeto_final/paginas/Introducao.dart';
import 'package:projeto_final/paginas/Lista.dart';
import 'package:projeto_final/paginas/Login.dart';

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
