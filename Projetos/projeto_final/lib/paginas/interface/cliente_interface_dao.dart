import 'package:projeto_final/paginas/dto/cliente.dart';

abstract class ClienteInterfaceDAO {
  Future<Cliente> salvar(Cliente cliente);
  Future<bool> excluir(int id);
  Future<Cliente> consultar(int id);
  Future<List<Cliente>> consultarTodos();
  Future<void> adicionarEndereco(int clienteId, int enderecoId);
  Future<void> removerEndereco(int clienteId, int enderecoId);
}