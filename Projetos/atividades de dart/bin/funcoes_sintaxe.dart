import 'package:atividade_1/atividade_1.dart' as atividade_1;
import 'dart:io';

void main(List<String> arguments) {
  print("sintaxe");
  print(verificarAprovacao4());
}

//função com retorno e com parâmetro
String verificarAprovacao5(double nota1, double nota2) {
  var media = (nota1 + nota2 / 2);
  if (media >= 6) {
    return 'aprovado';
  } else {
    return 'reprovado';
  }
  //return (media > 6) ? 'aprovado : 'reprovado';
}

//função sem retorno e sem parâmetro
void verificarAprovacao2() {
  double nota1, nota2, media;

  print('informa nota1: ');
  nota1 = double.parse(stdin.readLineSync()!);

  print('informa nota2: ');
  nota2 = double.parse(stdin.readLineSync()!);

  media = (nota1 + nota2) / 2;

/*
  if (media >= 6){
    print ('aprovado');
  }else{
    print ('reprovado');
  }
*/

  print((media >= 6) ? 'aprovado' : 'reprovado');
}

//função sem retorno com parâmetro
void verificarAprovacao3(double nota1, double nota2) {
  double media = (nota1 + nota2) / 2;
  print((media >= 6) ? 'aprovado' : 'reprovado');
}

verificarAprovacao4() {
  double nota1, nota2, media;

  print('informa nota1: ');
  nota1 = double.parse(stdin.readLineSync()!);

  print('informa nota2: ');
  nota2 = double.parse(stdin.readLineSync()!);

  media = (nota1 + nota2) / 2;

  if (media >= 6) {
    return 'aprovado';
  } else {
    return 'reprovado';
  }
}
/*
-> função sem retorno e sem parâmetro
-> função sem retorno e com parâmetro
-> função com retorno e sem parâmetro
-> função com retorno e com parâmetro

*/