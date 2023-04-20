import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/Catalogo.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('Catalogo'),
            onPressed: () {
              Navigator.pushNamed(context, 'catalogo');
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Configurações'),
            onPressed: () {
              Navigator.pushNamed(context, 'config');
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Perfil'),
            onPressed: () {
              Navigator.pushNamed(context, 'perfil');
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Sobre'),
            onPressed: () {
              Navigator.pushNamed(context, 'sobre');
            },
          ),
        ],
      ),
    );
  }
}