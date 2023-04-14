import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/Cadastro.dart';
import 'package:projeto_final/paginas/Compra.dart';
import 'package:projeto_final/paginas/Home.dart';
import 'package:projeto_final/paginas/Introducao.dart';
import 'package:projeto_final/paginas/Produto.dart';
import 'package:projeto_final/paginas/Login.dart';
import 'package:projeto_final/paginas/Catalogo.dart';

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
        '/': (context) => Introducao(),
        'cadastro': (context) => Cadastro(),
        'login': (context) => Login(),
        'home': (context) => Home(),
        //'config': (context) => Configuracoes(),
        //'perfil': (context) => Perfil(),
        //'sobre': (context) => Sobre(),
        'catalogo': (context) => Catalogo(),
        'compra': (context) => Compra(),
        //'compra_feita': (context) => Compra_feita(),
      }
    );
  }
}
