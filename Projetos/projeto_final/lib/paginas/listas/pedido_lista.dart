import 'package:flutter/material.dart';
import 'package:projeto_final/database/sqlite/dao/pedido_dao_sqlite.dart';
import 'package:projeto_final/paginas/App.dart';
import 'package:projeto_final/paginas/dto/pedido.dart';
import 'package:projeto_final/paginas/interface/pedido_interface_dao.dart';
import 'package:projeto_final/paginas/widget/barra_navegacao.dart';
import 'package:projeto_final/paginas/widget/botao_adicionar.dart';
import 'package:projeto_final/paginas/widget/painel_botoes.dart';

class PedidoLista extends StatefulWidget {
  PedidoLista({Key? key}) : super(key: key);

  @override
  _PedidoListaState createState() => _PedidoListaState();
}

class _PedidoListaState extends State<PedidoLista> {
  PedidoInterfaceDAO dao = PedidoDAOSQLite();
  List<Pedido> listaPedidos = [];

  @override
  void initState() {
    super.initState();
    carregarPedidos();
  }

  Future<void> carregarPedidos() async {
    final pedidos = await dao.consultarTodos();
    setState(() {
      listaPedidos = pedidos ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista Pedidos')),
      body: criarLista(context),
      floatingActionButton: BotaoAdicionar(
        acao: () async {
          final result = await Navigator.pushNamed(context, 'pedido_form');
          if (result != null) {
            setState(() {
              listaPedidos.add(result as Pedido);
            });
          }
        },
      ),
      bottomNavigationBar: const BarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget criarLista(BuildContext context) {
    if (listaPedidos.isEmpty) {
      return const Center(
        child: Text('Não há pedidos...'),
      );
    }

    return ListView.builder(
      itemCount: listaPedidos.length,
      itemBuilder: (context, indice) {
        var pedido = listaPedidos[indice];
        return criarItemLista(context, pedido);
      },
    );
  }

  Future<List<Pedido>> buscarPedido() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Pedido pedido) {
    return ItemLista(
      pedido: pedido,
      alterar: () async {
        final result = await Navigator.pushNamed(context, 'pedido_form',
            arguments: pedido);
        if (result != null) {
          setState(() {
            int index = listaPedidos.indexOf(pedido);
            listaPedidos[index] = result as Pedido;
          });
        }
      },
      detalhes: () {
        Navigator.pushNamed(context, 'pedido_detalhe', arguments: pedido);
      },
      excluir: () async {
        await dao.excluir(pedido.id);
        await carregarPedidos();
        if (listaPedidos.isEmpty) {
          setState(() {});
        }
      },
    );
  }
}

class ItemLista extends StatelessWidget {
  final Pedido pedido;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.pedido,
      required this.alterar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${pedido.data}"),
      subtitle: Text("${pedido.descricao}, ${pedido.clienteId.nome}"),
      trailing: PainelBotoes(alterar: alterar, excluir: excluir),
      onTap: detalhes,
    );
  }
}
