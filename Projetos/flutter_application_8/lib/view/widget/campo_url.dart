import 'package:flutter/material.dart';
import 'package:flutter_application_8/view/widget/campo_interface.dart';

// ignore: use_key_in_widget_constructors
class CampoURL extends StatelessWidget implements CampoInterface{
  final controle = TextEditingController();
  
  @override 
  Widget build(BuildContext context){
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.url,
      validator: (valorDigitado){
        return ehVazio(valorDigitado);
      },
      decoration: const InputDecoration( 
        label: Text('URL Avatar:'),
        hintText: 'www.endereco.com'
      ),
    );
  }

  String? ehVazio(String? valorDigitado){
    if(valorDigitado == null || valorDigitado.isEmpty) return 'O campo é obrigatório';
    return null;
  }

  @override
  String getValue(){
    return controle.text;
  }
}