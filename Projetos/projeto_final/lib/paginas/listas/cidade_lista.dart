import 'package:flutter/material.dart';
import 'package:projeto_final/database/sqlite/dao/cidade_dao_sqlite.dart';
import 'package:projeto_final/paginas/App.dart';
import 'package:projeto_final/paginas/dto/cidade.dart';
import 'package:projeto_final/paginas/interface/cidade_interface_dao.dart';
import 'package:projeto_final/paginas/widget/barra_navegacao.dart';
import 'package:projeto_final/paginas/widget/botao_adicionar.dart';
import 'package:projeto_final/paginas/widget/painel_botoes.dart';

class CidadeLista extends StatefulWidget {
  CidadeLista({Key? key}) : super(key: key);

  @override
  _CidadeListaState createState() => _CidadeListaState();
}

class _CidadeListaState extends State<CidadeLista> {
  CidadeInterfaceDAO dao = CidadeDAOSQLite();
  List<Cidade> listaCidades = [];

  @override
  void initState() {
    super.initState();
    carregarCidades();
  }

  Future<void> carregarCidades() async {
    final cidades = await dao.consultarTodos();
    setState(() {
      listaCidades = cidades ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista Cidades')),
      body: criarLista(context),
      floatingActionButton: BotaoAdicionar(
        acao: () async {
          final result = await Navigator.pushNamed(context, 'cidade_form');
          if (result != null) {
            setState(() {
              listaCidades.add(result as Cidade);
            });
          }
        },
      ),
      bottomNavigationBar: const BarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget criarLista(BuildContext context) {
    if (listaCidades.isEmpty) {
      return const Center(
        child: Text('Não há cidades...'),
      );
    }

    return ListView.builder(
      itemCount: listaCidades.length,
      itemBuilder: (context, indice) {
        var cidade = listaCidades[indice];
        return criarItemLista(context, cidade);
      },
    );
  }

  Future<List<Cidade>> buscarCidade() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Cidade cidade) {
    return ItemLista(
      cidade: cidade,
      alterar: () async {
        final result = await Navigator.pushNamed(context, 'cidade_form',
            arguments: cidade);
        if (result != null) {
          setState(() {
            int index = listaCidades.indexOf(cidade);
            listaCidades[index] = result as Cidade;
          });
        }
      },
      detalhes: () {
        Navigator.pushNamed(context, 'cidade_detalhe', arguments: cidade);
      },
      excluir: () async {
        await dao.excluir(cidade.id);
        await carregarCidades();
        if (listaCidades.isEmpty) {
          setState(() {});
        }
      },
    );
  }
}

class ItemLista extends StatelessWidget {
  final Cidade cidade;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.cidade,
      required this.alterar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${cidade.nome}"),
      subtitle: Text("${cidade.estado.nome}"),
      trailing: PainelBotoes(alterar: alterar, excluir: excluir),
      onTap: detalhes,
    );
  }
}
