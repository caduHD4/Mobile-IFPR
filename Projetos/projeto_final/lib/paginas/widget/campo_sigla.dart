import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoSigla extends StatelessWidget {
  final qtdeMinimaCaracteres = 2;
  final mascara = '[A-Za-z\u00C0-\u00FF ]';
  final TextEditingController controle;
  const CampoSigla({required this.controle, Key? key}) : super(key: key);

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
        label: Text('Sigla:'),
        hintText: 'Informe a sigla'
      ),
    );
  }

  String? ehVazio(String? valorDigitado){
    if(valorDigitado == null || valorDigitado.isEmpty) return 'O campo é obrigatório';
    return null;
  }
  
  String? temMinimoCaracteres(String? valorDigitado){
    if(valorDigitado!.length < qtdeMinimaCaracteres) return 'O campo deve possuir pelo menos 2 caracteres';
    return null;
  }
}