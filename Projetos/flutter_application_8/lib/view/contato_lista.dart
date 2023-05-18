import 'package:flutter/material.dart';
import 'package:flutter_application_8/rota.dart';
import 'package:flutter_application_8/view/database/fake/contatao_dao.dart';
import 'package:flutter_application_8/view/dto/contato.dart';
import 'package:flutter_application_8/view/interface/contato_dao_interface.dart';


class ContatoLista extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista Contatos')),
      body: criarLista(),
      floatingActionButton: criarBotao(context),
      bottomNavigationBar: criarBarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }

    Widget criarLista() {
    ContatoDaoInterface dao = ContatoDAO();
    return FutureBuilder(
      future: dao.buscarTodos(),
      builder: (BuildContext context, AsyncSnapshot<List<Contato>> lista){
        if(!lista.hasData) return CircularProgressIndicator();
        if(lista.data == null) return Container();
        List<Contato> listaContato = lista.data!;
        return ListView.builder(
          itemCount: listaContato.length,
          itemBuilder: (context, indice){
            var contato = listaContato[indice];
            return ListTile(title: Text(contato.nome!,),
            leading: Image.network(contato.URLAvatar!),
            subtitle: Text("${contato.telefone!} \n ${contato.email!}"),
            );
          }
        );
      }
    );
  }

  BottomAppBar criarBarraNavegacao(){
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Container(height: 50.0),
    );
  }

  FloatingActionButton criarBotao(BuildContext context){
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context,Rota.contatoForm),
      tooltip: 'Adicionar novo contato',
      child: const Icon(Icons.add),
    );
  }
}