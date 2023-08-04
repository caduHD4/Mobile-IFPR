import 'package:flutter/material.dart';
import 'package:projeto_final/database/sqlite/dao/produto_dao_sqlite.dart';
import 'package:projeto_final/paginas/dto/produto.dart';
import 'package:projeto_final/paginas/interface/produto_interface_dao.dart';
import 'package:projeto_final/paginas/widget/botao.dart';
import 'package:projeto_final/paginas/widget/campo_descricao.dart';
import 'package:projeto_final/paginas/widget/campo_nome.dart';
import 'package:projeto_final/paginas/widget/campo_preco.dart';
import 'package:projeto_final/paginas/widget/campo_url.dart';

class ProdutoForm extends StatefulWidget {
  const ProdutoForm({Key? key}) : super(key: key);

  @override
  State<ProdutoForm> createState() => _ProdutoFormState();
}

class _ProdutoFormState extends State<ProdutoForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;
  final campoNome = CampoNome(controle: TextEditingController());
  final campoDescricao = CampoDescricao(controle: TextEditingController());
  final campoPreco = CampoPreco(controle: TextEditingController());
  final campoUrlAvatar = CampoURL(controle: TextEditingController());

  @override
  Widget build(BuildContext context) {
    receberProdutoParaAlteracao(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              campoNome,
              campoDescricao,
              campoPreco,
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
          var produto = preencherDTO();
          ProdutoInterfaceDAO dao = ProdutoDAOSQLite();
          dao.salvar(produto);
          Navigator.pop(context, produto);
        }
      },
    );
  }

  void receberProdutoParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Produto produto = parametro.settings.arguments as Produto;
      id = produto.id;
      preencherCampos(produto);
    }
  }

  Produto preencherDTO() {
    return Produto(
      id: id,
      nome: campoNome.controle.text,
      descricao: campoDescricao.controle.text,
      urlAvatar: campoUrlAvatar.controle.text,
      preco: double.parse(campoPreco.controle.text),
    );
  }

  void preencherCampos(Produto produto) {
    campoNome.controle.text = produto.nome;
    campoDescricao.controle.text = produto.descricao;
    campoPreco.controle.text = produto.preco.toString();
  }
}
