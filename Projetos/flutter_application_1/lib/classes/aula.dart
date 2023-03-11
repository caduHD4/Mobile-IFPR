import 'package:flutter_application_1/classes/aluno3.dart';
import 'package:flutter_application_1/classes/aluno4.dart';
import 'aluno.dart';
import 'professor.dart';
import 'aluno2.dart';
void main(){
  print('aula');

  var aluno = new Aluno();
  aluno.nome = 'João';
  aluno.RA = 324353665;
  aluno.CPF = '123.456.789-88';

  var professor = Professor(
    nome: 'Helio', 
    SIAPE: '3536', 
    CPF: '333.333.333.33', 
    faculdade: 'IFPR, unipar',
    funcaoProfessor: funcaoChamarAluno);


    var professora = Professor(
      nome: 'Helio',
      SIAPE: '3536',
      CPF: '333.333.333.33',
      faculdade: 'IFPR, unipar',
      funcaoProfessor:  (){
        print('presente?');
      });

  var aluno2 = Aluno2(1111,'josé','111.111.111.11');

  var aluno3 = Aluno3(
    RA: 333,
    nome: 'Maria',
    CPF: '444.444.444.44');

  var aluno4 = Aluno4(
    RA: 777, 
    nome: 'Marcio', 
    CPF: '777.777.777.77',
    minhaFuncao: (){
      print('buscar livro');
    });

    var aluno4a = Aluno4(
      RA: 777,
      nome: 'Marcio',
      CPF: '777.777.777.77',
      minhaFuncao: funcaoBuscarLivro);

  print(' ${aluno.nome} ${aluno.RA}');
  print(' ${aluno2.nome} ${aluno2.RA}');
  print(' ${aluno3.nome} ${aluno3.RA}');
  print(' ${aluno4.nome} ${aluno4.RA}');

  print('${Aluno3(
    CPF: '4444', 
    nome: 'Joaquim', 
    RA: 23)}');
}

void funcaoBuscarLivro(){
  print('buscar livro');
}

void funcaoChamarAluno() {
  print('presente?');
}
