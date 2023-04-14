import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/Cadastro.dart';
import 'package:projeto_final/paginas/Home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('login')),
      body: ElevatedButton(
        child: const Text('Home'),
        onPressed: () {
          Navigator.pushNamed(context, 'home');
        },
      ),
    );
  }
}
