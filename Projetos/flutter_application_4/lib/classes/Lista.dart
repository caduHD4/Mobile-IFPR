import 'package:flutter/material.dart';
import 'package:flutter_application_4/classes/Cadastro.dart';
import 'package:flutter_application_4/classes/Detalhes.dart';
import 'package:flutter_application_4/classes/Home.dart';
import 'package:flutter_application_4/classes/Lista.dart';

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
