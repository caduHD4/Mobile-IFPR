import 'package:persistencia/view/dto/estado.dart';

class Cidade{
  final dynamic id;
  final String nome;
  final Estado estado;
  Cidade({
    required this.id,
    required this.nome,
    required this.estado
  });
}