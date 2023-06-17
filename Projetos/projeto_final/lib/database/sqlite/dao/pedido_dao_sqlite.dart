import 'package:projeto_final/database/sqlite/conexao.dart';
import 'package:projeto_final/paginas/dto/pedido.dart';
import 'package:sqflite/sqflite.dart';

class PedidoDAOSQLite {
  Future<Pedido> salvar(Pedido pedido) async {
    Database db = await Conexao.criar();
    if (pedido.id == null) {
      int id = await db.insert('pedido', {
        'data': pedido.data,
        'cliente_id': pedido.clienteId,
      });
      return Pedido(id: id, data: pedido.data, clienteId: pedido.clienteId);
    } else {
      await db.update(
          'pedido',
          {
            'data': pedido.data,
            'cliente_id': pedido.clienteId,
          },
          where: 'id = ?',
          whereArgs: [pedido.id]);
      return pedido;
    }
  }

  Future<bool> excluir(int id) async {
    Database db = await Conexao.criar();
    int linhasAfetadas =
        await db.delete('pedido', where: 'id = ?', whereArgs: [id]);
    return linhasAfetadas > 0;
  }

  Future<Pedido> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map<String, dynamic>> resultado =
        await db.query('pedido', where: 'id = ?', whereArgs: [id]);
    if (resultado.isEmpty) throw Exception('Não foi encontrado registro com este id');
    Map<String, dynamic> registro = resultado.first;
    return Pedido(
        id: registro['id'],
        data: registro['data'],
        clienteId: registro['cliente_id']);
  }

  Future<List<Pedido>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Map<String, dynamic>> resultado = await db.query('pedido');
    return resultado.map((registro) => Pedido(
        id: registro['id'],
        data: registro['data'],
        clienteId: registro['cliente_id'])).toList();
  }
}