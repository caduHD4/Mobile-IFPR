import 'package:projeto_final/paginas/dto/produto.dart';

abstract class ProdutoInterfaceDAO {
  Future<Produto> salvar(Produto produto);
  Future<bool> excluir(int id);
  Future<Produto> consultar(int id);
  Future<List<Produto>> consultarTodos();
}