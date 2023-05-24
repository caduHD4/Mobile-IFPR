import 'package:flutter/material.dart';

class CampoCidade extends StatelessWidget {
  final TextEditingController controle;

  const CampoCidade({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      validator: (valorDigitado) => validarCidade(valorDigitado),
      decoration: const InputDecoration(
        label: Text('Cidade:'),
        hintText: 'Digite a Cidade',
      ),
    );
  }

  String? validarCidade(String? valorDigitado) {
    if (valorDigitado == null || valorDigitado.isEmpty) {
      return 'O campo é obrigatório';
    }

    // Aqui você pode adicionar a lógica de validação da cidade,
    // como verificar se a cidade existe em uma lista predefinida
    // ou se o formato está correto.

    return null;
  }
}
