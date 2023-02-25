import 'package:atividade_1/atividade_1.dart' as atividade_1;
import 'dart:io';

void main(List<String> arguments) {
  print('variaveis de inferencia');
  
  String? nome;
  print('Informe o seu nome:');
  String? entrada = stdin.readLineSync();
  if(entrada != null){
    nome = entrada;
  }


/*Atividade 03 - ao invés de atribuir valores solicite dados
String para int -> int.parse
String para double -> double.parse
int para string -> variavel.toString()
*/



}