import 'package:flutter/material.dart';
import 'package:projeto_final/database/daofake/endereco_dao_fake.dart';
import 'package:projeto_final/paginas/dto/endereco.dart';
import 'package:projeto_final/paginas/interface/endereco_interface_dao.dart';
import 'package:projeto_final/paginas/widget/botao.dart';
import 'package:projeto_final/paginas/widget/campo_nome.dart';
import 'package:projeto_final/paginas/widget/campo_telefone.dart';
import 'package:projeto_final/paginas/widget/campo_cpf.dart';
import 'package:projeto_final/paginas/widget/campo_cep.dart';
import 'package:projeto_final/paginas/widget/campo_estado.dart';
import 'package:projeto_final/paginas/widget/campo_cidade.dart';
import 'package:projeto_final/paginas/widget/campo_bairro.dart';
import 'package:projeto_final/paginas/widget/campo_rua.dart';
import 'package:projeto_final/paginas/widget/campo_numero.dart';
import 'package:projeto_final/paginas/widget/campo_complemento.dart';

class EnderecoForm extends StatefulWidget {
  const EnderecoForm({Key? key}) : super(key: key);

  @override
  State<EnderecoForm> createState() => _EnderecoFormState();
}

class _EnderecoFormState extends State<EnderecoForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;
  @override
  Widget build(BuildContext context) {
    receberEnderecoParaAlteracao(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Cadastro')),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                campoNome,
                campoTelefone,
                campoCPF,
                campoCEP,
                campoEstado,
                campoCidade,
                campoBairro,
                campoRua,
                campoNumero,
                campoComplemento,
                criarBotao(context),
              ],
            )));
  }

  final campoNome = CampoNome(controle: TextEditingController());
  final campoTelefone = CampoTelefone(controle: TextEditingController());
  final campoCPF = CampoCPF(controle: TextEditingController());
  final campoCEP = CampoCEP(controle: TextEditingController());
  final campoEstado = CampoEstado(controle: TextEditingController());
  final campoCidade = CampoCidade(controle: TextEditingController());
  final campoBairro = CampoBairro(controle: TextEditingController());
  final campoRua = CampoRua(controle: TextEditingController());
  final campoNumero = CampoNumero(controle: TextEditingController());
  final campoComplemento = CampoComplemento(controle: TextEditingController());

  Widget criarBotao(BuildContext context) {
    return Botao(
      context: context,
      salvar: () {
        var formState = formKey.currentState;
        if (formState != null && formState.validate()) {
          var endereco = preencherDTO();
          EnderecoInterfaceDAO dao = EnderecoDAOFake();
          dao.salvar(endereco);
          Navigator.pop(context);
        }
      },
    );
  }

  void receberEnderecoParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Endereco endereco = parametro.settings.arguments as Endereco;
      id = endereco.id;
      preencherCampos(endereco);
    }
  }

  Endereco preencherDTO() {
    return Endereco(
      id: id,
      nome: campoNome.controle.text,
      telefone: campoTelefone.controle.text,
      cpf: campoCPF.controle.text,
      cep: campoCEP.controle.text,
      estado: campoEstado.controle.text,
      cidade: campoCidade.controle.text,
      bairro: campoBairro.controle.text,
      rua: campoRua.controle.text,
      numero: campoNumero.controle.text,
      complemento: campoComplemento.controle.text,
    );
  }

  void preencherCampos(Endereco endereco) {
    campoNome.controle.text = endereco.nome;
    campoTelefone.controle.text = endereco.telefone;
    campoCPF.controle.text = endereco.cpf;
    campoCEP.controle.text = endereco.cep;
    campoEstado.controle.text = endereco.estado;
    campoCidade.controle.text = endereco.cidade;
    campoBairro.controle.text = endereco.bairro;
    campoRua.controle.text = endereco.rua;
    campoNumero.controle.text = endereco.numero;
    campoComplemento.controle.text = endereco.complemento;
  }
}
