import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/dto/endereco.dart';
import 'package:projeto_final/paginas/widget/foto_endereco.dart';

class EnderecoDetalhes extends StatelessWidget {
  const EnderecoDetalhes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Endereco endereco = ModalRoute.of(context)?.settings.arguments as Endereco;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Endereço')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Center(
              child: FotoEndereco(endereco: endereco),
            ),
            const SizedBox(height: 16.0),
            Text('Nome: ${endereco.nome}'),
            const SizedBox(height: 8.0),
            Text('Telefone: ${endereco.telefone}'),
            const SizedBox(height: 8.0),
            Text('CPF: ${endereco.cpf}'),
            const SizedBox(height: 8.0),
            Text('CEP: ${endereco.cep}'),
            const SizedBox(height: 8.0),
            Text('Estado: ${endereco.estado}'),
            const SizedBox(height: 8.0),
            Text('Cidade: ${endereco.cidade}'),
            const SizedBox(height: 8.0),
            Text('Bairro: ${endereco.bairro}'),
            const SizedBox(height: 8.0),
            Text('Rua: ${endereco.rua}'),
            const SizedBox(height: 8.0),
            Text('Número: ${endereco.numero}'),
            const SizedBox(height: 8.0),
            Text('Complemento: ${endereco.complemento}'),
          ],
        ),
      ),
    );
  }
}
