import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/Cadastro.dart';
import 'package:projeto_final/paginas/Home.dart';
import 'package:projeto_final/paginas/Compra.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: ElevatedButton(
        child: const Text('Compra'),
        onPressed: () {
          Route rota = MaterialPageRoute(builder: (context) => Compra());
          //Navigator.of(context).push(rota);
          Navigator.push(context, rota);
        },
      ),
    );
  }
}
     