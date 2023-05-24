import 'package:projeto_final/paginas/dto/endereco.dart';

abstract class EnderecoInterfaceDAO{
  Endereco salvar(Endereco endereco);
  bool excluir(dynamic id);
  Future<Endereco> consultar(int id);
  Future<List<Endereco>>  consultarTodos();
}