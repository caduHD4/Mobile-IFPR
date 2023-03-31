import 'package:flutter/material.dart';
import 'package:flutter_application_4/classes/Cadastro.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
   Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text ('Home')),
      body: ElevatedButton(
        child: const Text ('Cadastro'),
        onPressed: (){
          Route rota = MaterialPageRoute(
            builder: (context) => Cadastro());
          //Navigator.of(context).push(rota);
          Navigator.push(context, rota);

        },
      ),
    );
  }
}