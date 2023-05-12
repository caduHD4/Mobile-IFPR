import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_8/view/widget/campo_interface.dart';

// ignore: use_key_in_widget_constructors
class CampoNome extends StatelessWidget implements CampoInterface{
  final qtdeMinimaCaracteres = 3;
  final mascara = '[A-Za-z\u00C0-\u00FF]';
  final controle = TextEditingController();
  
  @override 
  Widget build(BuildContext context){
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.name,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(mascara))],
      validator: (valorDigitado){
        String? msnErro = ehVazio(valorDigitado) ?? temMinimoCaracteres(valorDigitado);
        return msnErro;
      },
      decoration: const InputDecoration( 
        label: Text('Nome:'),
        hintText: 'Informe o seu nome'
      ),
    );
  }

  String? ehVazio(String? valorDigitado){
    if(valorDigitado == null || valorDigitado.isEmpty) return 'O campo é obrigatório';
    return null;
  }
  
  String? temMinimoCaracteres(String? valorDigitado){
    if(valorDigitado!.length < qtdeMinimaCaracteres) return 'O campo deve possuir pelo menos 3 caracteres';
    return null;
  }

  @override
  String getValue(){
    return controle.text;
  }
}