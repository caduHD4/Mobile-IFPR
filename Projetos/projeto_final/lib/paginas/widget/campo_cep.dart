import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CampoCEP extends StatelessWidget {
  final mascara = '#####-###';
  final TextEditingController controle;
  
  const CampoCEP({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.number,
      inputFormatters: [MaskTextInputFormatter(mask: mascara)],
      validator: (valorDigitado) => validarCEP(valorDigitado),
      decoration: const InputDecoration(
        label: Text('CEP:'),
        hintText: 'Digite o CEP',
      ),
    );
  }

  String? validarCEP(String? valorDigitado) {
    if (valorDigitado == null || valorDigitado.isEmpty) {
      return 'O campo é obrigatório';
    }

    if (valorDigitado.length != 9) {
      return 'CEP inválido';
    }

    return null;
  }
}
