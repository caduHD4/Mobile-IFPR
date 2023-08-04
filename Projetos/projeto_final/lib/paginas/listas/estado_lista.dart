import 'package:flutter/material.dart';
import 'package:projeto_final/database/sqlite/dao/estado_dao_sqlite.dart';
import 'package:projeto_final/paginas/App.dart';
import 'package:projeto_final/paginas/dto/estado.dart';
import 'package:projeto_final/paginas/interface/estado_interface_dao.dart';
import 'package:projeto_final/paginas/widget/barra_navegacao.dart';
import 'package:projeto_final/paginas/widget/botao_adicionar.dart';
import 'package:projeto_final/paginas/widget/painel_botoes.dart';

class EstadoLista extends StatefulWidget {
  EstadoLista({Key? key}) : super(key: key);

  @override
  _EstadoListaState createState() => _EstadoListaState();
}

class _EstadoListaState extends State<EstadoLista> {
  EstadoInterfaceDAO dao = EstadoDAOSQLite();
  List<Estado> listaEstados = [];

  @override
  void initState() {
    super.initState();
    carregarEstados();
  }

  Future<void> carregarEstados() async {
    final estados = await dao.consultarTodos();
    setState(() {
      listaEstados = estados ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista Estados')),
      body: criarLista(context),
      floatingActionButton: BotaoAdicionar(
        acao: () async {
          final result = await Navigator.pushNamed(context, 'estado_form');
          if (result != null) {
            setState(() {
              listaEstados.add(result as Estado);
            });
          }
        },
      ),
      bottomNavigationBar: const BarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget criarLista(BuildContext context) {
    if (listaEstados.isEmpty) {
      return const Center(
        child: Text('Não há estados...'),
      );
    }

    return ListView.builder(
      itemCount: listaEstados.length,
      itemBuilder: (context, indice) {
        var estado = listaEstados[indice];
        return criarItemLista(context, estado);
      },
    );
  }

  Future<List<Estado>> buscarEstado() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Estado estado) {
    return ItemLista(
      estado: estado,
      alterar: () async {
        final result = await Navigator.pushNamed(context, 'estado_form',
            arguments: estado);
        if (result != null) {
          setState(() {
            int index = listaEstados.indexOf(estado);
            listaEstados[index] = result as Estado;
          });
        }
      },
      detalhes: () {
        Navigator.pushNamed(context, 'estado_detalhe', arguments: estado);
      },
      excluir: () async {
        await dao.excluir(estado.id);
        await carregarEstados();
        if (listaEstados.isEmpty) {
          setState(() {});
        }
      },
    );
  }
}

class ItemLista extends StatelessWidget {
  final Estado estado;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.estado,
      required this.alterar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${estado.nome}"),
      subtitle: Text("${estado.sigla}"),
      trailing: PainelBotoes(alterar: alterar, excluir: excluir),
      onTap: detalhes,
    );
  }
}
