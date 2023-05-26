import 'package:flutter/material.dart';
import 'package:projeto_final/database/daofake/endereco_dao_fake.dart';
import 'package:projeto_final/database/sqlite/dao/contato_dao_sqlite.dart';
import 'package:projeto_final/paginas/App.dart';
import 'package:projeto_final/paginas/dto/endereco.dart';
import 'package:projeto_final/paginas/interface/endereco_interface_dao.dart';
import 'package:projeto_final/paginas/widget/barra_navegacao.dart';
import 'package:projeto_final/paginas/widget/botao_adicionar.dart';
import 'package:projeto_final/paginas/widget/foto_endereco.dart';
import 'package:projeto_final/paginas/widget/painel_botoes.dart';

class EnderecoLista extends StatefulWidget {
  EnderecoLista({Key? key}) : super(key: key);

  @override
  _EnderecoListaState createState() => _EnderecoListaState();
}

class _EnderecoListaState extends State<EnderecoLista> {
  EnderecoInterfaceDAO dao = EnderecoDAOSQLite();
  List<Endereco> listaEnderecos = [];

  @override
  void initState() {
    super.initState();
    carregarEnderecos();
  }

  Future<void> carregarEnderecos() async {
    final enderecos = await dao.consultarTodos();
    setState(() {
      listaEnderecos = enderecos ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista Enderecos')),
      body: criarLista(context),
      floatingActionButton: BotaoAdicionar(
          acao: () => Navigator.pushNamed(context, 'endereco_form')
              .then((value) => buscarEndereco())),
      bottomNavigationBar: const BarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget criarLista(BuildContext context) {
    if (listaEnderecos.isEmpty) {
      return const Center(
        child: Text('Não há enderecos...'),
      );
    }

    return ListView.builder(
      itemCount: listaEnderecos.length,
      itemBuilder: (context, indice) {
        var endereco = listaEnderecos[indice];
        return criarItemLista(context, endereco);
      },
    );
  }

  Future<List<Endereco>> buscarEndereco() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Endereco endereco) {
    return ItemLista(
      endereco: endereco,
      alterar: () {
        Navigator.pushNamed(context, 'endereco_form', arguments: endereco).then((value) => buscarEndereco());
        
      },
      detalhes: () {
        Navigator.pushNamed(context, 'endereco_detalhe', arguments: endereco);
      },
      excluir: () async {
        await dao.excluir(endereco.id);
        await carregarEnderecos(); // Atualiza a lista após excluir
        if (listaEnderecos.isEmpty) {
          setState(() {}); // Atualiza o estado da lista vazia
        }
        //buscarEndereco();
      },
    );
  }
}

class ItemLista extends StatelessWidget {
  final Endereco endereco;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.endereco,
      required this.alterar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FotoEndereco(endereco: endereco),
      title: Text(endereco.nome),
      subtitle: Text("${endereco.telefone}, ${endereco.cidade}, ${endereco.estado}, ${endereco.rua}, ${endereco.numero}"),
      trailing: PainelBotoes(alterar: alterar, excluir: excluir),
      onTap: detalhes,
    );
  }
}
