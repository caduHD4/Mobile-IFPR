import 'package:flutter/material.dart';
import 'package:flutter_application_4/classes/Cadastro.dart';
import 'package:flutter_application_4/classes/Home.dart';
import 'package:flutter_application_4/classes/Login.dart';

class Introducao extends StatelessWidget {
  const Introducao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Introducao')),
      body: ElevatedButton(
        child: const Text('Iniciar'),
        onPressed: () {
          Route rota = MaterialPageRoute(builder: (context) => Login());
          //Navigator.of(context).push(rota);
          Navigator.pushNamed(context, 'login');
        },
      ),
    );
  }
}
