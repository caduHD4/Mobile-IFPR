import 'package:flutter/material.dart';

class CampoNumero extends StatelessWidget {
  final TextEditingController controle;

  const CampoNumero({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.number,
      validator: (valorDigitado) => validarNumero(valorDigitado),
      decoration: const InputDecoration(
        label: Text('Número:'),
        hintText: 'Digite o Número',
      ),
    );
  }

  String? validarNumero(String? valorDigitado) {
    if (valorDigitado == null || valorDigitado.isEmpty) {
      return 'O campo é obrigatório';
    }

    // Aqui você pode adicionar a lógica de validação do número,
    // como verificar se o formato está correto ou se é um número válido.

    return null;
  }
}
