import 'package:projeto_final/database/sqlite/conexao.dart';
import 'package:projeto_final/paginas/dto/produto.dart';
import 'package:projeto_final/paginas/interface/produto_interface_dao.dart';
import 'package:sqflite/sqflite.dart';

class ProdutoDAOSQLite implements ProdutoInterfaceDAO {
  @override
  Future<Produto> salvar(Produto produto) async {
    Database db = await Conexao.criar();
    if (produto.id == null) {
      int id = await db.insert('produto', {
        'nome': produto.nome,
        'preco': produto.preco,
      });
      return Produto(id: id, nome: produto.nome, preco: produto.preco);
    } else {
      await db.update(
          'produto',
          {
            'nome': produto.nome,
            'preco': produto.preco,
          },
          where: 'id = ?',
          whereArgs: [produto.id]);
      return produto;
    }
  }

  @override
  Future<bool> excluir(int id) async {
    Database db = await Conexao.criar();
    int linhasAfetadas =
        await db.delete('produto', where: 'id = ?', whereArgs: [id]);
    return linhasAfetadas > 0;
  }

  @override
  Future<Produto> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map<String, dynamic>> resultado =
        await db.query('produto', where: 'id = ?', whereArgs: [id]);
    if (resultado.isEmpty) throw Exception('Não foi encontrado registro com este id');
    Map<String, dynamic> registro = resultado.first;
    return Produto(
        id: registro['id'],
        nome: registro['nome'],
        preco: registro['preco']);
  }

  @override
  Future<List<Produto>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Map<String, dynamic>> resultado = await db.query('produto');
    return resultado.map((registro) => Produto(
        id: registro['id'],
        nome: registro['nome'],
        preco: registro['preco'])).toList();
  }
}