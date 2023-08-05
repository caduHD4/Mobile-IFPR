import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/dto/produto.dart';
import 'package:projeto_final/paginas/widget/foto_produto_detalhes.dart';

class DetalhesProduto extends StatelessWidget {
  const DetalhesProduto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Produto produto =
        ModalRoute.of(context)!.settings.arguments as Produto;

    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FotoProdutoDetalhes(produto: produto),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produto.nome,
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'R\$${produto.preco.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Descrição: ${produto.descricao}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'compra');
                    },
                    child: Text('Comprar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
