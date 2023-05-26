import 'package:projeto_final/database/sqlite/conexao.dart';
import 'package:projeto_final/paginas/dto/endereco.dart';
import 'package:projeto_final/paginas/interface/endereco_interface_dao.dart';
import 'package:sqflite/sqflite.dart'; //importação

class EnderecoDAOSQLite implements EnderecoInterfaceDAO {
   @override
  Future<Endereco> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps =
        await db.query('Endereco', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty)
      throw Exception('Não foi encontrado registro com este id');
    Map<dynamic, dynamic> resultado = maps.first;
    return converterEndereco(resultado);
  }

  @override
  Future<List<Endereco>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Endereco> lista =
        (await db.query('endereco')).map<Endereco>(converterEndereco).toList();
    return lista;
  }

   @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM endereco WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }


  @override
  Future<Endereco> salvar(Endereco endereco) async {
    Database db = await Conexao.criar();
    String sql;
    if (endereco.id == null) {
      sql =
          'INSERT INTO endereco (nome, telefone, cpf, cep, estado, cidade, bairro, rua, numero, complemento) VALUES (?,?,?,?,?,?,?,?,?,?)';
      int id = await db.rawInsert(sql,
          [endereco.nome, endereco.telefone, endereco.cpf, endereco.cep, endereco.estado, endereco.cidade, endereco.bairro, endereco.rua, endereco.numero, endereco.complemento ]);
      endereco = Endereco(
        id: id,
        nome: endereco.nome,
        telefone: endereco.telefone,
        cpf: endereco.cpf,
        cep: endereco.cep,
        estado: endereco.estado,
        cidade: endereco.cidade,
        bairro: endereco.bairro,
        rua: endereco.rua,
        numero: endereco.numero,
        complemento: endereco.complemento);
    } else {
      sql =
          'UPDATE endereco SET nome = ?, telefone = ?, cpf = ?, cep = ?, estado = ?, cidade = ?, bairro = ?, rua =?, numero = ?, complemento = ?  WHERE id = ?';
      db.rawUpdate(sql, [
        endereco.nome,
        endereco.telefone,
        endereco.cpf,
        endereco.cep,
        endereco.estado,
        endereco.cidade,
        endereco.bairro,
        endereco.rua,
        endereco.numero,
        endereco.complemento,
        endereco.id
      ]);
    }
    return endereco;
  }


    Endereco converterEndereco(Map<dynamic, dynamic> resultado) {
    return Endereco(
        id: resultado['id'],
        nome: resultado['nome'],
        telefone: resultado['telefone'],
        cpf: resultado['cpf'],
        cep: resultado['cep'],
        estado: resultado['estado'],
        cidade: resultado['cidade'],
        bairro: resultado['bairro'],
        rua: resultado['rua'],
        numero: resultado['numero'],
        complemento: resultado['complemento']);
  }

}
