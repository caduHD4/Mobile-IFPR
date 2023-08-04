import 'package:flutter/material.dart';

class CampoPreco extends StatelessWidget {
  final TextEditingController controle;

  const CampoPreco({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      validator: (valorDigitado) => validarPreco(valorDigitado),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: const InputDecoration(
        label: Text('Preço:'),
        hintText: 'Digite o preço',
      ),
    );
  }

  String? validarPreco(String? valorDigitado) {
    if (valorDigitado == null || valorDigitado.isEmpty) {
      return 'O campo é obrigatório';
    }

    final preco = double.tryParse(valorDigitado);
    if (preco == null) {
      return 'O valor digitado não é um número válido';
    }

    if (preco <= 0) {
      return 'O preço deve ser maior que zero';
    }

    // Aqui você pode adicionar a lógica de validação do preço,
    // como verificar se o preço está dentro de uma faixa predefinida.

    return null;
  }
}