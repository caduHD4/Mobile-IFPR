import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/dto/endereco.dart';
import 'package:projeto_final/paginas/widget/foto_endereco.dart';

class EnderecoDetalhes extends StatelessWidget {
  const EnderecoDetalhes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Endereco endereco =
        ModalRoute.of(context)?.settings.arguments as Endereco;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Endereço')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Center(
              child: Container(
                width: 80.0,
                height: 80.0,
                child: FotoEndereco(endereco: endereco),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Nome: ${endereco.nome}',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Telefone: ${endereco.telefone}',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 12.0),
            Text(
              'CPF: ${endereco.cpf}',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 12.0),
            Text(
              'CEP: ${endereco.cep}',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 12.0),
            Text(
              'Estado: ${endereco.estado}',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 12.0),
            Text(
              'Cidade: ${endereco.cidade}',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 12.0),
            Text(
              'Bairro: ${endereco.bairro}',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 12.0),
            Text(
              'Rua: ${endereco.rua}',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 12.0),
            Text(
              'Número: ${endereco.numero}',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 12.0),
            Text(
              'Complemento: ${endereco.complemento}',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
