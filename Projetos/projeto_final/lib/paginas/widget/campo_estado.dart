import 'package:flutter/material.dart';

class CampoEstado extends StatelessWidget {
  final TextEditingController controle;

  const CampoEstado({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      validator: (valorDigitado) => validarEstado(valorDigitado),
      decoration: const InputDecoration(
        label: Text('Estado:'),
        hintText: 'Digite o Estado',
      ),
    );
  }

  String? validarEstado(String? valorDigitado) {
    if (valorDigitado == null || valorDigitado.isEmpty) {
      return 'O campo é obrigatório';
    }

    // Aqui você pode adicionar a lógica de validação do estado,
    // como verificar se o estado existe em uma lista predefinida
    // ou se o formato está correto.

    return null;
  }
}
