import 'package:flutter/material.dart';
import 'package:flutter_application_8/view/widget/campo_email.dart';
import 'package:flutter_application_8/view/widget/campo_nome.dart';
import 'package:flutter_application_8/view/widget/campo_telefone.dart';
import 'package:flutter_application_8/view/widget/campo_url.dart';

class ContatoForm extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Form(
        key: _formKey,
        child: Column( 
          children: [
            campoNome,
            campoTelefone,
            campoEmail,
            campoURL,
            criarBotao(context),
          ],
        )
      )
    );
  }

  var campoNome = CampoNome();
  var campoTelefone = CampoTelefone();
  var campoEmail = CampoEmail();
  var campoURL = CampoURL();

  ElevatedButton criarBotao(BuildContext context){
    return ElevatedButton( 
      child: const Text('ok'),
      onPressed: () {
         acaoBotao(context);
      },
    );
  }

  void acaoBotao(BuildContext context){
    if(_formKey.currentState!.validate()){
        _formKey.currentState!.save();
        Navigator.pop(context);
    }
  }
}