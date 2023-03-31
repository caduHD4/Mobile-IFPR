import 'package:flutter/material.dart';
import 'package:flutter_application_4/classes/Cadastro.dart';
import 'package:flutter_application_4/classes/Home.dart';
import 'package:flutter_application_4/classes/Lista.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: ElevatedButton(
        child: const Text('Lista'),
        onPressed: () {
          Route rota = MaterialPageRoute(builder: (context) => Lista());
          //Navigator.of(context).push(rota);
          Navigator.push(context, rota);
        },
      ),
    );
  }
}
     