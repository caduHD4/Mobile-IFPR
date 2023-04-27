import 'package:flutter/material.dart';

class Acesso extends StatelessWidget {
  const Acesso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Acesso')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('Login'),
            onPressed: () {
              Navigator.pushNamed(context, 'login');
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Cadastro'),
            onPressed: () {
              Navigator.pushNamed(context, 'cadastro');
            },
          ),
        ],
      ),
    );
  }
}

