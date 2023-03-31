import 'package:flutter/material.dart';
import 'package:flutter_application_4/classes/Cadastro.dart';
import 'package:flutter_application_4/classes/Home.dart';

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
