import 'package:flutter/material.dart';
import 'package:projeto_final/database/sqlite/dao/cidade_dao_sqlite.dart';
import 'package:projeto_final/paginas/dto/cidade.dart';
import 'package:projeto_final/database/sqlite/dao/contato_dao_sqlite.dart';
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
import 'package:projeto_final/paginas/listas/endereco_lista.dart';

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
    Future<List<Cidade>> cidades = CidadeDAOSQLite().consultarTodos();
    receberEnderecoParaAlteracao(context);
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
                    campoCPF,
                    campoCEP,
                    campoEstado,
                    campoOpcoes = criarCampoOpcoes(listaCidades),
                    campoBairro,
                    campoRua,
                    campoNumero,
                    campoComplemento,
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
  final campoCPF = CampoCPF(controle: TextEditingController());
  final campoCEP = CampoCEP(controle: TextEditingController());
  final campoEstado = CampoEstado(controle: TextEditingController());
  final campoBairro = CampoBairro(controle: TextEditingController());
  final campoRua = CampoRua(controle: TextEditingController());
  final campoNumero = CampoNumero(controle: TextEditingController());
  final campoComplemento = CampoComplemento(controle: TextEditingController());
  late DropdownButton<Cidade> campoOpcoes;
  late List<Cidade> listaCidades;
  late Cidade cidadeSelecionada;


  Widget criarBotao(BuildContext context) {
    return Botao(
      context: context,
      salvar: () async {
        var formState = formKey.currentState;
        if (formState != null && formState.validate()) {
          var endereco = preencherDTO();
          EnderecoInterfaceDAO dao = EnderecoDAOSQLite();
          await dao.salvar(endereco);
          Navigator.pop(context, endereco);
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

  Endereco preencherDTO() {
    return Endereco(
      id: id,
      nome: campoNome.controle.text,
      telefone: campoTelefone.controle.text,
      cpf: campoCPF.controle.text,
      cep: campoCEP.controle.text,
      estado: campoEstado.controle.text,
      cidade: cidadeSelecionada,
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
    campoBairro.controle.text = endereco.bairro;
    campoRua.controle.text = endereco.rua;
    campoNumero.controle.text = endereco.numero;
    campoComplemento.controle.text = endereco.complemento;
  }
}
