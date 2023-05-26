/*import 'package:projeto_final/database/daofake/dados_fake.dart';
import 'package:projeto_final/paginas/dto/endereco.dart';
import 'package:projeto_final/paginas/interface/endereco_interface_dao.dart';

class EnderecoDAOFake implements EnderecoInterfaceDAO {
  @override
  Future<Endereco> consultar(int id) {
    return Future.value(enderecos[id - 1]);
  }

  @override
  Future<List<Endereco>> consultarTodos() {
    return Future.value(enderecos);
  }

 @override
  bool excluir(dynamic id) {
    print('excluir ${enderecos[id-1]}');
    enderecos.remove(enderecos[id-1]);
    return true;
  }

  @override
  Endereco salvar(Endereco endereco) {
    if (endereco.id == null) {
      endereco = Endereco(
        id: enderecos.length,
        nome: endereco.nome,
        telefone: endereco.telefone,
        cpf: endereco.cpf,
        cep: endereco.cep,
        estado: endereco.estado,
        cidade: endereco.cidade,
        bairro: endereco.bairro,
        rua: endereco.rua,
        numero: endereco.numero,
        complemento: endereco.complemento,
      );
      enderecos.add(endereco);
    } else {
      int i = (endereco.id as int) - 1;
      enderecos[i] = endereco;
    }
    print(endereco);
    return endereco;
  }
}
*/