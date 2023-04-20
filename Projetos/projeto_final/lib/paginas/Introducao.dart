import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/Acesso.dart';

class Introducao extends StatelessWidget {
  const Introducao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Introducao')),
      body: ElevatedButton(
        child: const Text('Iniciar'),
        onPressed: () {
          Navigator.pushNamed(context, 'acesso');
        },
      ),
    );
  }
}
