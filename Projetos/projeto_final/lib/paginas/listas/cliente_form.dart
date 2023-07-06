import 'package:flutter/material.dart';
import 'package:projeto_final/database/sqlite/dao/cliente_dao_sqlite.dart';
import 'package:projeto_final/paginas/dto/cliente.dart';
import 'package:projeto_final/paginas/interface/cliente_interface_dao.dart';
import 'package:projeto_final/paginas/widget/botao.dart';
import 'package:projeto_final/paginas/widget/campo_nome.dart';
import 'package:projeto_final/paginas/widget/campo_cpf.dart';

class ClienteForm extends StatefulWidget {
  const ClienteForm({Key? key}) : super(key: key);

  @override
  State<ClienteForm> createState() => _ClienteFormState();
}

class _ClienteFormState extends State<ClienteForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;
  final campoNome = CampoNome(controle: TextEditingController());
  final campoCPF = CampoCPF(controle: TextEditingController());

  @override
  Widget build(BuildContext context) {
    receberClienteParaAlteracao(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              campoNome,
              campoCPF,
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
          var cliente = preencherDTO();
          ClienteInterfaceDAO dao = ClienteDAOSQLite();
          dao.salvar(cliente);
          Navigator.pop(context, cliente);
        }
      },
    );
  }

  void receberClienteParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Cliente cliente = parametro.settings.arguments as Cliente;
      id = cliente.id;
      preencherCampos(cliente);
    }
  }

  Cliente preencherDTO() {
    return Cliente(
      id: id,
      nome: campoNome.controle.text,
      cpf: campoCPF.controle.text,
    );
  }

  void preencherCampos(Cliente cliente) {
    campoNome.controle.text = cliente.nome;
    campoCPF.controle.text = cliente.cpf;
  }
}
