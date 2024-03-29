import 'package:projeto_final/paginas/dto/estado.dart';

abstract class EstadoInterfaceDAO{
  Future<Estado> salvar(Estado estado);
  Future<bool> excluir(dynamic id);
  Future<Estado> consultar(int id);
  Future<List<Estado>>  consultarTodos();
}