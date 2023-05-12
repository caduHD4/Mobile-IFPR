import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: use_key_in_widget_constructors
class Campo<T> extends StatelessWidget {
  Function(String) quandoSalvar;
  TextInputType tipoTeclado;
  int minimoCaracteres;
  int maximoCaracteres;
  String mascara;
  final controle = TextEditingController();
  List<String? Function(String?)>? validacoes;
  String? msnErro;

  Campo({
    required this.quandoSalvar,
    this.minimoCaracteres = 0,
    this.maximoCaracteres = 200,
    this.tipoTeclado = TextInputType.none,
    this.mascara = '[^~,]',
    this.validacoes
  });
  
  @override 
  Widget build(BuildContext context){
    return TextFormField(
      controller: controle,
      keyboardType: tipoTeclado,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(mascara))],
      validator: (valorDigitado){
        if(validacoes == null ) msnErro = null;
        for(var validacao in validacoes!) {
          msnErro = validacao(valorDigitado);
          if(msnErro != null) break;
        }
        return msnErro;
      },
      maxLength: maximoCaracteres,
    );
  }

  T getValue(){
    return controle.text as T;
  }
}