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
import 'package:projeto_final/paginas/listas/cidade_form.dart';
import 'package:projeto_final/paginas/listas/cidade_lista.dart';
import 'package:projeto_final/paginas/listas/endereco_form.dart';
import 'package:projeto_final/paginas/listas/endereco_lista.dart';
import 'package:projeto_final/paginas/listas/endereco_detalhes.dart';
import 'package:projeto_final/paginas/listas/cliente_lista.dart';
import 'package:projeto_final/paginas/listas/cliente_form.dart';

import 'package:projeto_final/constants.dart';
import 'package:projeto_final/paginas/listas/estado_form.dart';
import 'package:projeto_final/paginas/listas/estado_lista.dart';
import 'package:projeto_final/paginas/listas/pedido_lista.dart';
import 'package:projeto_final/paginas/listas/produto_form.dart';
import 'package:projeto_final/paginas/listas/produto_lista.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Farma System',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: TextTheme(
          headline6:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
        'config': (context) => Configu(),
        'perfil': (context) => Perfil(),
        'sobre': (context) => Sobre(),
        'cliente_lista': (context) => ClienteLista(),
        'cliente_form': (context) => ClienteForm(),
        /*'cliente_detalhe': (context) => ClienteDetalhes(), */
        'estado_lista': (context) => EstadoLista(),
        'estado_form': (context) => EstadoForm(),
        /*'estado_detalhe': (context) => EstadoDetalhes(), */
        'cidade_lista': (context) => CidadeLista(),
        'cidade_form': (context) => CidadeForm(),
        /*'cidade_detalhe': (context) => EstadoDetalhes(), */
        'produto_lista': (context) => ProdutoLista(),
        'produto_form': (context) => ProdutoForm(),
        /*'produto_detalhe': (context) => `Produto`Detalhes(), */
        'pedido_lista': (context) => PedidoLista(),
        'endereco_lista': (context) => EnderecoLista(),
        'endereco_form': (context) => EnderecoForm(),
        'endereco_detalhe': (context) => EnderecoDetalhes(),
        'catalogo': (context) => Catalogo(),
        'compra': (context) => Compra(),
      },
    );
  }
}
