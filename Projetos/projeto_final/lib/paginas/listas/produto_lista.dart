import 'package:flutter/material.dart';
import 'package:projeto_final/database/sqlite/dao/produto_dao_sqlite.dart';
import 'package:projeto_final/paginas/App.dart';
import 'package:projeto_final/paginas/dto/produto.dart';
import 'package:projeto_final/paginas/interface/produto_interface_dao.dart';
import 'package:projeto_final/paginas/widget/barra_navegacao.dart';
import 'package:projeto_final/paginas/widget/botao_adicionar.dart';
import 'package:projeto_final/paginas/widget/foto_produto.dart';
import 'package:projeto_final/paginas/widget/painel_botoes.dart';

class ProdutoLista extends StatefulWidget {
  ProdutoLista({Key? key}) : super(key: key);

  @override
  _ProdutoListaState createState() => _ProdutoListaState();
}

class _ProdutoListaState extends State<ProdutoLista> {
  ProdutoInterfaceDAO dao = ProdutoDAOSQLite();
  List<Produto> listaProdutos = [];

  @override
  void initState() {
    super.initState();
    carregarProdutos();
  }

  Future<void> carregarProdutos() async {
    final produtos = await dao.consultarTodos();
    setState(() {
      listaProdutos = produtos ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista Produtos')),
      body: criarLista(context),
      floatingActionButton: BotaoAdicionar(
        acao: () async {
          final result = await Navigator.pushNamed(context, 'produto_form');
          if (result != null) {
            setState(() {
              listaProdutos.add(result as Produto);
            });
          }
        },
      ),
      bottomNavigationBar: const BarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget criarLista(BuildContext context) {
    if (listaProdutos.isEmpty) {
      return const Center(
        child: Text('Não há produtos...'),
      );
    }

    return ListView.builder(
      itemCount: listaProdutos.length,
      itemBuilder: (context, indice) {
        var produto = listaProdutos[indice];
        return criarItemLista(context, produto);
      },
    );
  }

  Future<List<Produto>> buscarProduto() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Produto produto) {
    return ItemLista(
      produto: produto,
      alterar: () async {
        final result = await Navigator.pushNamed(context, 'produto_form',
            arguments: produto);
        if (result != null) {
          setState(() {
            int index = listaProdutos.indexOf(produto);
            listaProdutos[index] = result as Produto;
          });
        }
      },
      detalhes: () {
        Navigator.pushNamed(context, 'produto_detalhe', arguments: produto);
      },
      excluir: () async {
        await dao.excluir(produto.id);
        await carregarProdutos();
        if (listaProdutos.isEmpty) {
          setState(() {});
        }
      },
    );
  }
}

class ItemLista extends StatelessWidget {
  final Produto produto;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.produto,
      required this.alterar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FotoProduto(produto: produto),
      title: Text("${produto.nome}"),
      
      subtitle: Text("${produto.descricao}, R\$${produto.preco}"),
      trailing: PainelBotoes(alterar: alterar, excluir: excluir),
      onTap: detalhes,
    );
  }
}
