import 'package:projeto_final/paginas/dto/endereco.dart';

abstract class EnderecoInterfaceDAO{
  Future<Endereco> salvar(Endereco endereco);
  Future<bool> excluir(dynamic id);
  Future<Endereco> consultar(int id);
  Future<List<Endereco>>  consultarTodos();
}