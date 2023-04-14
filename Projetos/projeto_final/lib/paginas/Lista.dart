import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/Cadastro.dart';
import 'package:projeto_final/paginas/Detalhes.dart';
import 'package:projeto_final/paginas/Home.dart';
import 'package:projeto_final/paginas/Lista.dart';

class Lista extends StatelessWidget {
  const Lista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista')),
      body: ElevatedButton(
        child: const Text('Detalhes'),
        onPressed: () {
          Route rota = MaterialPageRoute(builder: (context) => Detalhes());
          //Navigator.of(context).push(rota);
          Navigator.push(context, rota);
        },
      ),
    );
  }
}
