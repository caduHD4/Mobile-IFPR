import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/Compra.dart';


class Produto extends StatelessWidget {
  const Produto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produto')),
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
