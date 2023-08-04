import 'package:flutter/material.dart';
import 'package:projeto_final/database/sqlite/dao/cidade_dao_sqlite.dart';
import 'package:projeto_final/paginas/dto/cidade.dart';
import 'package:projeto_final/paginas/interface/cidade_interface_dao.dart';
import 'package:projeto_final/paginas/widget/botao.dart';
import 'package:projeto_final/paginas/widget/campo_opcoes_estado.dart';
import 'package:projeto_final/paginas/widget/campo_nome.dart';
import 'package:projeto_final/paginas/widget/campo_cpf.dart';

class CidadeForm extends StatefulWidget {
  const CidadeForm({Key? key}) : super(key: key);

  @override
  State<CidadeForm> createState() => _CidadeFormState();
}

class _CidadeFormState extends State<CidadeForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;
  final campoNome = CampoNome(controle: TextEditingController());
  final campoEstado = CampoOpcoesEstado();

  @override
  Widget build(BuildContext context) {
    receberCidadeParaAlteracao(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              campoNome,
              campoEstado,
              criarBotao(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget criarBotao(BuildContext context) {
    return Botao(
      context: context,
      salvar: () {
        var formState = formKey.currentState;
        if (formState != null && formState.validate()) {
          var cidade = preencherDTO();
          CidadeInterfaceDAO dao = CidadeDAOSQLite();
          dao.salvar(cidade);
          Navigator.pop(context, cidade);
        }
      },
    );
  }

  void receberCidadeParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Cidade cidade = parametro.settings.arguments as Cidade;
      id = cidade.id;
      preencherCampos(cidade);
    }
  }

  Cidade preencherDTO() {
    return Cidade(
      id: id,
      nome: campoNome.controle.text,
      estado: campoEstado.opcaoSelecionado!,
    );
  }

  void preencherCampos(Cidade cidade) {
    campoNome.controle.text = cidade.nome;
    campoEstado.opcaoSelecionado = cidade.estado;
  }
}
