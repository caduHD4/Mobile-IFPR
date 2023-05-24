import 'package:flutter/material.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CampoCPF extends StatelessWidget {
  final mascara = '###.###.###-##';
  final TextEditingController controle;

  const CampoCPF({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.number,
      inputFormatters: [MaskTextInputFormatter(mask: mascara)],
      validator: (valorDigitado) => validarCPF(valorDigitado),
      decoration: const InputDecoration(
        label: Text('CPF:'),
        hintText: 'Digite o CPF',
      ),
    );
  }

  String? validarCPF(String? valorDigitado) {
    if (valorDigitado == null || valorDigitado.isEmpty) {
      return 'O campo é obrigatório';
    }

    if (valorDigitado.length != 14) {
      return 'CPF inválido';
    }

    final cpf = valorDigitado.replaceAll(RegExp(r'\D'), '');

    if (!CPFValidator.isValid(cpf)) {
      return 'CPF inválido';
    }

    return null;
  }
}
