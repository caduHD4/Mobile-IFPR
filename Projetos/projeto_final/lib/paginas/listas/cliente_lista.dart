import 'package:flutter/material.dart';
import 'package:projeto_final/database/sqlite/dao/cliente_dao_sqlite.dart';
import 'package:projeto_final/paginas/App.dart';
import 'package:projeto_final/paginas/dto/cliente.dart';
import 'package:projeto_final/paginas/interface/cliente_interface_dao.dart';
import 'package:projeto_final/paginas/widget/barra_navegacao.dart';
import 'package:projeto_final/paginas/widget/botao_adicionar.dart';
import 'package:projeto_final/paginas/widget/painel_botoes.dart';

class ClienteLista extends StatefulWidget {
  ClienteLista({Key? key}) : super(key: key);

  @override
  _ClienteListaState createState() => _ClienteListaState();
}

class _ClienteListaState extends State<ClienteLista> {
  ClienteInterfaceDAO dao = ClienteDAOSQLite();
  List<Cliente> listaClientes = [];

  @override
  void initState() {
    super.initState();
    carregarClientes();
  }

  Future<void> carregarClientes() async {
    final clientes = await dao.consultarTodos();
    setState(() {
      listaClientes = clientes ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista Clientes')),
      body: criarLista(context),
      floatingActionButton: BotaoAdicionar(
        acao: () async {
          final result = await Navigator.pushNamed(context, 'cliente_form');
          if (result != null) {
            setState(() {
              listaClientes.add(result as Cliente);
            });
          }
        },
      ),
      bottomNavigationBar: const BarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget criarLista(BuildContext context) {
    if (listaClientes.isEmpty) {
      return const Center(
        child: Text('Não há clientes...'),
      );
    }

    return ListView.builder(
      itemCount: listaClientes.length,
      itemBuilder: (context, indice) {
        var cliente = listaClientes[indice];
        return criarItemLista(context, cliente);
      },
    );
  }

  Future<List<Cliente>> buscarCliente() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Cliente cliente) {
    return ItemLista(
      cliente: cliente,
      alterar: () async {
        final result = await Navigator.pushNamed(context, 'cliente_form',
            arguments: cliente);
        if (result != null) {
          setState(() {
            int index = listaClientes.indexOf(cliente);
            listaClientes[index] = result as Cliente;
          });
        }
      },
      detalhes: () {
        Navigator.pushNamed(context, 'cliente_detalhe', arguments: cliente);
      },
      excluir: () async {
        await dao.excluir(cliente.id);
        await carregarClientes();
        if (listaClientes.isEmpty) {
          setState(() {});
        }
      },
    );
  }
}

class ItemLista extends StatelessWidget {
  final Cliente cliente;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.cliente,
      required this.alterar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${cliente.nome}"),
      subtitle: Text("${cliente.nome}, ${cliente.cpf}"),
      trailing: PainelBotoes(alterar: alterar, excluir: excluir),
      onTap: detalhes,
    );
  }
}
