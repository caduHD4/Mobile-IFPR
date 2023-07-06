import 'package:projeto_final/database/sqlite/conexao.dart';
import 'package:projeto_final/paginas/dto/cidade.dart';
import 'package:projeto_final/paginas/dto/cliente.dart';
import 'package:projeto_final/paginas/dto/endereco.dart';
import 'package:projeto_final/paginas/dto/estado.dart';
import 'package:projeto_final/paginas/interface/cliente_interface_dao.dart';
import 'package:sqflite/sqflite.dart';

class ClienteDAOSQLite implements ClienteInterfaceDAO {
  @override
  Future<Cliente> salvar(Cliente cliente) async {
    Database db = await Conexao.criar();
    if (cliente.id == null) {
      int id = await db.insert('cliente', {'nome': cliente.nome, 'cpf': cliente.cpf});
      return Cliente(id: id, nome: cliente.nome, cpf: cliente.cpf);
    } else {
      await db.update('cliente', {'nome': cliente.nome, 'cpf': cliente.cpf},
          where: 'id = ?', whereArgs: [cliente.id]);
      return cliente;
    }
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM cliente WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }


  @override
  Future<Cliente> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map<String, dynamic>> resultado =
        await db.query('cliente', where: 'id = ?', whereArgs: [id]);
    if (resultado.isEmpty)
      throw Exception('Não foi encontrado registro com este id');
    Map<String, dynamic> registro = resultado.first;
    return Cliente(
        id: registro['id'], nome: registro['nome'], cpf: registro['cpf']);
  }

  @override
  Future<List<Cliente>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Map<String, dynamic>> resultado = await db.query('cliente');
    return resultado
        .map((registro) =>
            Cliente(id: registro['id'], nome: registro['nome'], cpf: registro['cpf']))
        .toList();
  }

  @override
  Future<void> adicionarEndereco(int clienteId, int enderecoId) async {
    Database db = await Conexao.criar();
    await db.insert('cliente_endereco',
        {'cliente_id': clienteId, 'endereco_id': enderecoId});
  }

  @override
  Future<void> removerEndereco(int clienteId, int enderecoId) async {
    Database db = await Conexao.criar();
    await db.delete('cliente_endereco',
        where: 'cliente_id = ? AND endereco_id = ?',
        whereArgs: [clienteId, enderecoId]);
  }

  Future<List<Endereco>> consultarEnderecos(int clienteId) async {
  Database db = await Conexao.criar();
  List<Map<String, dynamic>> resultado = await db.rawQuery('''
    SELECT e.* FROM endereco e
    JOIN cliente_endereco ce ON ce.endereco_id = e.id
    WHERE ce.cliente_id = ?
  ''', [clienteId]);
  return resultado.map((registro) => Endereco(
    id: registro['id'],
    nome: registro['nome'],
    telefone: registro['telefone'],
    cpf: registro['cpf'],
    cep: registro['cep'],
    estado: registro['estado'],
    cidade: Cidade(id: registro['cidade_id'], nome: '', estado: Estado(nome: registro['estado'], id: null, sigla: '')),
    bairro: registro['bairro'],
    rua: registro['rua'],
    numero: registro['numero'],
    complemento: registro['complemento']
  )).toList();
}
}
