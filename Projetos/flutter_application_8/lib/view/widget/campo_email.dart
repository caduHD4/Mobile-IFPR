import 'package:flutter/material.dart';
import 'package:flutter_application_8/view/widget/campo_interface.dart';

// ignore: use_key_in_widget_constructors
class CampoEmail extends StatelessWidget implements CampoInterface{
  final controle = TextEditingController();
  
  @override 
  Widget build(BuildContext context){
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.emailAddress,
      validator: (valorDigitado){
        var msnErro = 
          ehVazio(valorDigitado) ?? 
          temArroba(valorDigitado);
        return msnErro;
          
      },
      decoration: const InputDecoration( 
        label: Text('E-mail:'),
        hintText: 'email@dominio.com'
      ),
    );
  }

  String? ehVazio(String? valorDigitado){
    if(valorDigitado == null || valorDigitado.isEmpty) return 'O campo é obrigatório';
    return null;
  }

  String? temArroba(String? valorDigitado){
    if(!valorDigitado!.contains('@')) return 'E-mail deve porruir "@".';
    return null;
  }

  @override
  String getValue(){
    return controle.text;
  }
}