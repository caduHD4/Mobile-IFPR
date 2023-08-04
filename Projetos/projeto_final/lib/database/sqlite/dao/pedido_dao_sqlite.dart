import 'package:projeto_final/database/sqlite/conexao.dart';
import 'package:projeto_final/database/sqlite/dao/cliente_dao_sqlite.dart';
import 'package:projeto_final/database/sqlite/dao/estado_dao_sqlite.dart';
import 'package:projeto_final/paginas/dto/cliente.dart';
import 'package:projeto_final/paginas/dto/pedido.dart';
import 'package:projeto_final/paginas/dto/estado.dart';
import 'package:projeto_final/paginas/interface/pedido_interface_dao.dart';
import 'package:sqflite/sqflite.dart';

class PedidoDAOSQLite implements PedidoInterfaceDAO {
  @override
  Future<Pedido> consultar(int id) async {
    Database db = await Conexao.criar();
    Map resultado =
        (await db.query('pedido', where: 'id = ?', whereArgs: [id])).first;
    if (resultado.isEmpty)
      throw Exception('Não foi encontrado registro com este id');
    return converter(resultado);
  }

  @override
  Future<List<Pedido>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Map<dynamic, dynamic>> resultadoBD = await db.query('pedido');
    List<Pedido> lista = [];
    for (var registro in resultadoBD) {
      var pedido = await converter(registro);
      lista.add(pedido);
    }
    return lista;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM pedido WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Pedido> salvar(Pedido pedido) async {
    Database db = await Conexao.criar();
    String sql;
    if (pedido.id == null) {
      sql = 'INSERT INTO pedido (nome, estado_id) VALUES (?,?)';
      int id = await db
          .rawInsert(sql, [pedido.data, pedido.clienteId.id, pedido.descricao]);
      pedido = Pedido(
          id: id,
          data: pedido.data,
          descricao: pedido.descricao,
          clienteId: pedido.clienteId);
    } else {
      sql = 'UPDATE pedido SET nome = ?, estado_id =? WHERE id = ?';
      db.rawUpdate(
          sql, [pedido.data, pedido.clienteId.id, pedido.id, pedido.descricao]);
    }
    return pedido;
  }

  Future<Pedido> converter(Map<dynamic, dynamic> resultado) async {
    Cliente cliente =
        await ClienteDAOSQLite().consultar(resultado['cliente_id']);
    return Pedido(
      id: resultado['id'],
      data: resultado['data'],
      descricao: resultado['descricao'],
      clienteId: cliente,
    );
  }
}
