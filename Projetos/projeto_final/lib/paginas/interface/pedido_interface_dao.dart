import 'package:projeto_final/paginas/dto/pedido.dart';

abstract class PedidoInterfaceDAO {
  Future<Pedido> salvar(Pedido pedido);
  Future<bool> excluir(int id);
  Future<Pedido> consultar(int id);
  Future<List<Pedido>> consultarTodos();
}