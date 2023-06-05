import 'package:flutter/material.dart';
import 'package:persistencia/database/sqlite/dao/cidade_dao_sqlite.dart';
import 'package:persistencia/database/sqlite/dao/contato_dao_sqlite.dart';
import 'package:persistencia/view/dto/cidade.dart';
import 'package:persistencia/view/dto/contato.dart';
import 'package:persistencia/view/interface/contato_interface_dao.dart';
import 'package:persistencia/view/widget/botao.dart';
import 'package:persistencia/view/widget/campo_email.dart';
import 'package:persistencia/view/widget/campo_nome.dart';
import 'package:persistencia/view/widget/campo_telefone.dart';
import 'package:persistencia/view/widget/campo_url.dart';

class ContatoForm extends StatefulWidget{
  const ContatoForm({Key? key}) : super(key: key);

  @override
  State<ContatoForm> createState() => _ContatoFormState();
}

class _ContatoFormState extends State<ContatoForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;

  @override
  Widget build(BuildContext context){
    Future<List<Cidade>> cidades = CidadeDAOSQLite().consultarTodos();
    receberContatoParaAlteracao(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: FutureBuilder(
        future: cidades,
        builder: (context,AsyncSnapshot<List<Cidade>> lista){
          if(!lista.hasData || lista.data == null) return const Text('Necessário realizar o cadastro de cidade');
          listaCidades = lista.data!;
          return Form(
            key: formKey,
            child: Column( 
              children: [
                campoNome,
                campoTelefone,
                campoEmail,
                campoURL,
                campoOpcoes = criarCampoOpcoes(listaCidades),
                criarBotao(context),
              ],
            )
          );
        }
      )
    );
  }

  final campoNome = CampoNome(controle: TextEditingController());
  final campoTelefone = CampoTelefone(controle: TextEditingController());
  final campoEmail = CampoEmail(controle: TextEditingController());
  final campoURL = CampoURL(controle: TextEditingController());
  late DropdownButton<Cidade> campoOpcoes;
  late List<Cidade> listaCidades;
  late Cidade cidadeSelecionada;

  Widget criarBotao(BuildContext context){
    return Botao(
      context: context,
      salvar: (){
        var formState = formKey.currentState;
        if(formState != null && formState.validate()){
          var  contato = preencherDTO();
          ContatoInterfaceDAO dao = ContatoDAOSQLite(); 
          dao.salvar(contato);
          Navigator.pop(context);
        }
      },
    );
  }

  void receberContatoParaAlteracao(BuildContext context){
    var parametro = ModalRoute.of(context);
    if(parametro != null && parametro.settings.arguments != null){
      Contato contato = parametro.settings.arguments as Contato;
      id = contato.id;
      preencherCampos(contato);
    }
  }
  
  DropdownButton<Cidade> criarCampoOpcoes(List<Cidade> cidades) {
    return DropdownButton<Cidade>(
      hint: const Text('cidade onde mora'),
      isExpanded: true,
      items: cidades.map(
        (cidade) => DropdownMenuItem(
          value: cidade,
          child: Text(cidade.nome))
      ).toList(),
      onChanged: (value){
        setState(() {
          if(value != null) cidadeSelecionada = value;
        });
      }
    );
  }

  Contato preencherDTO(){
    return Contato(
      id: id,
      nome: campoNome.controle.text,
      email: campoEmail.controle.text,
      telefone: campoTelefone.controle.text,
      urlAvatar: campoURL.controle.text,
      cidade: cidadeSelecionada
    );
  }

  void preencherCampos(Contato contato){
    campoNome.controle.text = contato.nome;
    campoEmail.controle.text = contato.email;
    campoTelefone.controle.text = contato.telefone;
    campoURL.controle.text = contato.urlAvatar;
  }
}
