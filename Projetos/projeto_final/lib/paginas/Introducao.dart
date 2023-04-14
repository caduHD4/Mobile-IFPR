import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/Cadastro.dart';
import 'package:projeto_final/paginas/Home.dart';
import 'package:projeto_final/paginas/Login.dart';

class Introducao extends StatelessWidget {
  const Introducao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Introducao')),
      body: ElevatedButton(
        child: const Text('Iniciar'),
        onPressed: () {
          Route rota = MaterialPageRoute(builder: (context) => Cadastro());
          //Navigator.of(context).push(rota);
          Navigator.pushNamed(context, 'login');
          Route rota2 = MaterialPageRoute(builder: (context) => Login());
          //Navigator.of(context).push(rota);
          Navigator.pushNamed(context, 'login');
          
        },
      ),
    );
  }
}
