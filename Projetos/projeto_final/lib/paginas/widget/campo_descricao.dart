import 'package:flutter/material.dart';

class CampoDescricao extends StatelessWidget {
  final TextEditingController controle;

  const CampoDescricao({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      validator: (valorDigitado) => validarDescricao(valorDigitado),
      decoration: const InputDecoration(
        label: Text('Descricao:'),
        hintText: 'Digite o Descricao',
      ),
    );
  }

  String? validarDescricao(String? valorDigitado) {
    if (valorDigitado == null || valorDigitado.isEmpty) {
      return 'O campo é obrigatório';
    }

    // Aqui você pode adicionar a lógica de validação do descricao,
    // como verificar se o descricao existe em uma lista predefinida
    // ou se o formato está correto.

    return null;
  }
}
