import 'package:sabados_letivos/farma_system.dart' as farma_system;
import 'dart:io';

void main(List<String> arguments) {
  // Exemplo de chamada da função:
  //cadastrarProduto("Dipirona", 100, 5.99);

}




//Duas funções sem retorno e sem parâmetro:

// Função para exibir mensagem de boas-vindas
void exibirMensagemDeBoasVindas() {
  print("Bem-vindo(a) ao sistema Farma System!");
}

// Função para exibir mensagem de encerramento
void exibirMensagemDeEncerramento() {
  print("Obrigado por utilizar o sistema da Farma System. Até!");
}




//Duas funções sem retorno e com parâmetro:

// Função para cadastrar um novo produto no estoque
void cadastrarProduto(String nome, int qtd, double preco) {

  String nomeProduto;
  int quantidade;
  double precoUnitario;

  nomeProduto = nome;
  quantidade = qtd;
  precoUnitario = preco;

  // Exibir mensagem de confirmação do cadastro
  print("Produto cadastrado com sucesso:");
  print("Nome: $nomeProduto");
  print("Quantidade: $quantidade");
  print("Preço unitário: R\$ $precoUnitario");
}


