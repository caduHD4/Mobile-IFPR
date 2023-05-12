import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_application_8/view/widget/campo_interface.dart';

// ignore: use_key_in_widget_constructors
class CampoTelefone extends StatelessWidget implements CampoInterface{
  final mascara = MaskTextInputFormatter(mask: '(##) # ####-####');
  final controle = TextEditingController();
  
  @override 
  Widget build(BuildContext context){
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.phone,
      inputFormatters: [mascara],
      validator: (valorDigitado) => ehVazio(valorDigitado),
      decoration: const InputDecoration( 
        label: Text('Telefone:'),
        hintText: '(DD) 99999-9999'
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