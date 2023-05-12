import 'package:flutter/material.dart';
import 'package:flutter_application_8/rota.dart';
import 'package:flutter_application_8/view/contato_detalhe.dart';
import 'package:flutter_application_8/view/contato_form.dart';
import 'package:flutter_application_8/view/contato_lista.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Rota.contatoLista :(context) => ContatoLista(),
        Rota.contatoForm :(context) => ContatoForm(),
        Rota.contatoDetalhe :(context) => ContatoDetalhe(),
      }
    );
  }
}