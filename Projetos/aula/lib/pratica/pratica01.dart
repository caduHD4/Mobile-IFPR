


import 'package:aula/pratica/cidade.dart';
import 'package:aula/pratica/estado.dart';
import 'package:aula/pratica/funcionario.dart';

void main(List<String> args) {
  /*
  Revisão 01
  objetivo:
  01 - capacidade e compreeção na criação objetos de uma classe
  → com ou sem referência, com ou sem new
  → especialmente de forma anônima e com parâmetros nomeados (muito utilizado em Dart)
  02 - capacidade de identificar parâmetros necessários
  → obrigatórios, opcionais, posicionais, nomeados, do tipo objeto e função
  → capacidade de identificar os tipos dos parâmetros das bibliotecas/código de outras pessoas
  03 - Domínio na sintaxe (escrita e leitura)
  → diferenciar ";" e ","
  → diferenciar ")" e "}"
  OBSERVAÇÃO: saber e/ou entender é muito diferente do que ter a prática!!! 
  → foi cedido diversas aulas para a prática!!!

  Prática
  01 - criar um funcionario com referência anônima
  → qual parâmetros são necessários?
    R: Os que estão nas lista de nomeados obrigatorios.
  → são parâmetros posicionais, nomeados, opcionais?
    R: Nomeados.
  → quais parâmetros são obrigatórios?
    R: todos ques estão com required.
  → quais tipos de parâmetros?
    R: String
  */

  Fornecedor(
    contato: 'Marcos',
    documento: '333.333.333-33',
    nome: 'Mercado Tio João',
    telefone: '(44 56844-7554)',
    cidade: Cidade(
      nome: 'PARANAVAI',
      estado: Estado(
        nome: 'PARANA', 
        sigla: 'PR',
      ),
    )
  );
}

