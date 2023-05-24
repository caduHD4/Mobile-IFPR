import 'package:flutter/material.dart';

class CampoBairro extends StatelessWidget {
  final TextEditingController controle;

  const CampoBairro({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      validator: (valorDigitado) => validarBairro(valorDigitado),
      decoration: const InputDecoration(
        label: Text('Bairro:'),
        hintText: 'Digite o Bairro',
      ),
    );
  }

  String? validarBairro(String? valorDigitado) {
    if (valorDigitado == null || valorDigitado.isEmpty) {
      return 'O campo é obrigatório';
    }

    // Aqui você pode adicionar a lógica de validação do bairro,
    // como verificar se o formato está correto ou se é um bairro válido.

    return null;
  }
}
