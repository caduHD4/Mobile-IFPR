import 'package:flutter_application_8/view/dto/contato.dart';

abstract class ContatoDaoInterface{
  Future <Contato> salvar(Contato contato);
  Future <List<Contato>> buscarTodos();
  Future <Contato> buscar(dynamic id);
  Future <Contato> alterar(Contato contato);
  Future <bool> excluir(dynamic id);
}