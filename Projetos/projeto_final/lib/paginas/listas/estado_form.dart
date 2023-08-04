import 'package:flutter/material.dart';
import 'package:projeto_final/database/sqlite/dao/estado_dao_sqlite.dart';
import 'package:projeto_final/paginas/dto/estado.dart';
import 'package:projeto_final/paginas/interface/estado_interface_dao.dart';
import 'package:projeto_final/paginas/widget/botao.dart';
import 'package:projeto_final/paginas/widget/campo_nome.dart';
import 'package:projeto_final/paginas/widget/campo_cpf.dart';
import 'package:projeto_final/paginas/widget/campo_sigla.dart';

class EstadoForm extends StatefulWidget {
  const EstadoForm({Key? key}) : super(key: key);

  @override
  State<EstadoForm> createState() => _EstadoFormState();
}

class _EstadoFormState extends State<EstadoForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;
  final campoNome = CampoNome(controle: TextEditingController());
  final campoSigla = CampoSigla(controle: TextEditingController());

  @override
  Widget build(BuildContext context) {
    receberEstadoParaAlteracao(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              campoNome,
              campoSigla,
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
          var estado = preencherDTO();
          EstadoInterfaceDAO dao = EstadoDAOSQLite();
          dao.salvar(estado);
          Navigator.pop(context, estado);
        }
      },
    );
  }

  void receberEstadoParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Estado estado = parametro.settings.arguments as Estado;
      id = estado.id;
      preencherCampos(estado);
    }
  }

  Estado preencherDTO() {
    return Estado(
      id: id,
      nome: campoNome.controle.text,
      sigla: campoSigla.controle.text,
    );
  }

  void preencherCampos(Estado estado) {
    campoNome.controle.text = estado.nome;
    campoSigla.controle.text = estado.sigla;
  }
}
