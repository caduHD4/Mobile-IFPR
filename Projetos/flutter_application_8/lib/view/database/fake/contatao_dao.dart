import 'package:flutter_application_8/view/dto/contato.dart';
import 'package:flutter_application_8/view/interface/contato_dao_interface.dart';

class ContatoDAO implements ContatoDaoInterface{
  var listaContatos = <Contato>[
    Contato.dados(
      id: 1,
      nome: 'João Pereira',
      email: 'joao@gmail.com',
      telefone: '(44) 99854-8569',
      URLAvatar: 'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png'),

    Contato.dados(
        id: 2,
        nome: 'cleber garcia',
        email: 'cleber@gmail.com',
        telefone: '(44) 96744-8569',
        URLAvatar:
            'https://cdn.pixabay.com/photo/2016/08/21/16/31/emoticon-1610228_1280.png'),

    Contato.dados(
        id: 3,
        nome: 'Pedrim Lima',
        email: 'pedro@gmail.com',
        telefone: '(44) 96434-5749',
        URLAvatar:
            'https://cdn.pixabay.com/photo/2016/03/31/19/58/avatar-1295430_1280.png'),

  ];


  @override
  Future <Contato> alterar(Contato contato) {
   print(contato);
   return Future.value(contato);

  }

  @override
  Future <Contato> buscar(id) {
    return Future.value(listaContatos[id-1]);
  }

  @override
  Future <List<Contato>> buscarTodos() {
    return Future.value(listaContatos);
  }

  @override
  Future <bool> excluir(id) {
   print(id);
   return Future.value(true);
  }

  @override
  Future <Contato> salvar(Contato contato) {
    print(contato);
    return Future.value(contato);
  }}
