import 'package:flutter/material.dart';
import 'package:projeto_final/database/sqlite/dao/produto_dao_sqlite.dart';
import 'package:projeto_final/paginas/DetalhesProduto.dart';
import 'package:projeto_final/paginas/dto/produto.dart';
import 'package:projeto_final/paginas/widget/foto_produto_home.dart';
import 'package:projeto_final/paginas/interface/produto_interface_dao.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProdutoInterfaceDAO dao = ProdutoDAOSQLite();
  List<Produto> listaProdutos = [];

  @override
  void initState() {
    super.initState();
    carregarProdutos();
  }

  Future<void> carregarProdutos() async {
    final produtos = await dao.consultarTodos();
    setState(() {
      listaProdutos = produtos ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Catálogo'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'perfil');
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 20,
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: Image.asset('assets/Saude.png').image,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: _buildProductGrid(),
    );
  }

  Widget _buildProductGrid() {
    if (listaProdutos.isEmpty) {
      return const Center(
        child: Text('Não há produtos...'),
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: listaProdutos.length,
      itemBuilder: (context, index) {
        var produto = listaProdutos[index];
        return _buildProductItem(produto);
      },
    );
  }

  Widget _buildProductItem(Produto produto) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhesProduto(),
            settings: RouteSettings(arguments: produto),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FotoProdutoHome(
                  produto:
                      produto), // Utiliza o widget FotoProduto com a imagem do produto
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produto.nome,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    produto.descricao,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'R\$${produto.preco.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
