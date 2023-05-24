import 'package:flutter/material.dart';

class CampoRua extends StatelessWidget {
  final TextEditingController controle;

  const CampoRua({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      validator: (valorDigitado) => validarRua(valorDigitado),
      decoration: const InputDecoration(
        label: Text('Rua:'),
        hintText: 'Digite a Rua',
      ),
    );
  }

  String? validarRua(String? valorDigitado) {
    if (valorDigitado == null || valorDigitado.isEmpty) {
      return 'O campo é obrigatório';
    }

    // Aqui você pode adicionar a lógica de validação da rua,
    // como verificar se o formato está correto ou se é uma rua válida.

    return null;
  }
}
