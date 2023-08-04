import 'package:projeto_final/paginas/dto/cliente.dart';

class Pedido {
  final dynamic id;
  final String data;
  final String descricao;
  final Cliente clienteId;

  Pedido(
      {required this.id,
      required this.data,
      required this.descricao,
      required this.clienteId});
}
