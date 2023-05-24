import 'package:flutter/material.dart';

class CampoComplemento extends StatelessWidget {
  final TextEditingController controle;

  const CampoComplemento({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      validator: (valorDigitado) => validarComplemento(valorDigitado),
      decoration: const InputDecoration(
        label: Text('Complemento:'),
        hintText: 'Digite o Complemento',
      ),
    );
  }

  String? validarComplemento(String? valorDigitado) {
    // O campo de Complemento é opcional, portanto, não é necessário validação.
    return null;
  }
}
