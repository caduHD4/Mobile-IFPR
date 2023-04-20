import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/Produto.dart';
import 'package:projeto_final/paginas/Cadastro.dart';
import 'package:projeto_final/paginas/Compra.dart';
import 'package:projeto_final/paginas/Home.dart';
import 'package:projeto_final/paginas/Produto.dart';

class Configu extends StatelessWidget {
  const Configu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuração')),
    );
  }
}