import 'package:persistencia/database/sqlite/conexao.dart';
import 'package:persistencia/view/dto/contato.dart';
import 'package:persistencia/view/interface/contato_interface_dao.dart';
import 'package:sqflite/sqflite.dart'; //importanção

class ContatoDAOSQLite implements ContatoInterfaceDAO{
  @override
  Future<Contato> consultar(int id) async {
    Database db = await  Conexao.criar();
    List<Map> maps = await db.query('Contato',where: 'id = ?',whereArgs: [id]);
    if (maps.isEmpty) throw Exception('Não foi encontrado registro com este id');
    Map<dynamic,dynamic> resultado = maps.first;
    return converterContato(resultado);
  }

  @override
  Future<List<Contato>> consultarTodos() async {
    Database db = await  Conexao.criar(); 
    List<Contato> lista = (await db.query('contato')).map<Contato>(converterContato).toList();
    return lista;
  }
  
  @override
  Future<bool> excluir(id) async {
    Database db = await  Conexao.criar();
    var sql ='DELETE FROM contato WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Contato> salvar(Contato contato) async {
    Database db = await  Conexao.criar();
    String sql;
    if(contato.id == null){
      sql = 'INSERT INTO contato (nome, telefone,email,url_avatar) VALUES (?,?,?,?)';
      int id = await db.rawInsert(sql,[contato.nome,contato.telefone,contato.email,contato.urlAvatar]);
      contato = Contato(
        id: id,
        nome: contato.nome, 
        telefone: contato.telefone, 
        email: contato.email, 
        urlAvatar: contato.urlAvatar);
    }else{
      sql = 'UPDATE contato SET nome = ?, telefone =?, email = ?, url_avatar= ? WHERE id = ?';
      db.rawUpdate(sql,[contato.nome, contato.telefone, contato.email, contato.urlAvatar, contato.id]);
    }
    return contato;
  }

  Contato converterContato(Map<dynamic,dynamic> resultado){
    return Contato(
      id : resultado['id'],
      nome: resultado['nome'],
      telefone: resultado['telefone'],
      email: resultado['email'],
      urlAvatar:  resultado['url_avatar']
    );
  }
}