import 'dart:ffi';

import 'package:atividade_1/atividade_1.dart' as atividade_1;
import 'dart:io';

void main(List<String> arguments) {
  produto();

/*Atividade 03 - ao invés de atribuir valores solicite dados
String para int -> int.parse
String para double -> double.parse
int para string -> variavel.toString()
*/
}

produto() {
  print('informe o modelo: ');
  String modelo = stdin.readLineSync()!;
  print('informe a ram: ');
  int ram = int.parse(stdin.readLineSync()!);
  print('informe o submodelo: ');
  String submodelo = stdin.readLineSync()!;
  print('informe o armazenamento: ');
  int armazenamento = int.parse(stdin.readLineSync()!);
  print('informe a cor: ');
  String cor = stdin.readLineSync()!;

  print(modelo);
  print(ram);
  print(submodelo);
  print(armazenamento);
  print(cor);
}
