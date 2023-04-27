import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/Produto.dart';

class Catalogo extends StatelessWidget {
  const Catalogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalogo')),
      body: ElevatedButton(
        child: const Text('Produto'),
        onPressed: () {
          Route rota = MaterialPageRoute(builder: (context) => Produto());
          //Navigator.of(context).push(rota);
          Navigator.push(context, rota);
        },
      ),
    );
  }
}
