import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/Cadastro.dart';
import 'package:projeto_final/paginas/Compra.dart';
import 'package:projeto_final/paginas/Home.dart';
import 'package:projeto_final/paginas/Acesso.dart';
import 'package:projeto_final/paginas/Introducao.dart';
import 'package:projeto_final/paginas/Login.dart';
import 'package:projeto_final/paginas/Catalogo.dart';
import 'package:projeto_final/paginas/Configu.dart';
import 'package:projeto_final/paginas/Perfil.dart';
import 'package:projeto_final/paginas/Sobre.dart';
import 'package:projeto_final/paginas/constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The best app of the world',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          button: TextStyle(color: kPrimaryColor),
          headline1:
              TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.2),
            ),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => Introducao(),
        'acesso': (context) => Acesso(),
        'cadastro': (context) => Cadastro(),
        'login': (context) => Login(),
        'home': (context) => Home(),
        'config':(context) => Configu(),
        'perfil':(context) => Perfil(),
        'sobre':(context) => Sobre(),
        'catalogo': (context) => Catalogo(),
        'compra': (context) => Compra(),
      },
    );
  }
}

