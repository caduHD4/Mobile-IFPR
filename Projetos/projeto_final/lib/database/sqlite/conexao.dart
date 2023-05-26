import 'package:path/path.dart';
import 'package:projeto_final/database/sqlite/scriptbd.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static late Database _database;
  static bool _fechado = true;

  static Future<Database> criar() async {
    if (_fechado) {
      String path = join(await getDatabasesPath(),'banco.db');                                
      _database = await openDatabase(
        path, 
        version: 1,
        onCreate: (db, v) {
          db.execute(criarEndereco);
          insercoesEndereco.forEach(db.execute);
        },
      );
      _fechado = false;
    }
    return _database;
  }
}
