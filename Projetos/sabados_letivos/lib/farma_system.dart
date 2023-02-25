

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




// Função para registrar uma venda
void registrarVenda(String nome, int qtd) {
  int quantidadeVendida;
  double valorTotal;

  // Verificar se o produto está disponível em estoque
  if (qtd > quantidadeEmEstoque) {
    print("Quantidade insuficiente em estoque.");
    return; // Encerrar a execução da função
  }

  // Atualizar a quantidade em estoque
  quantidadeEmEstoque -= qtd;

  // Calcular o valor total da venda
  valorTotal = qtd * precoUnitario;

  // Exibir mensagem de confirmação da venda
  print("Venda registrada com sucesso:");
  print("Nome: $nome");
  print("Quantidade vendida: $qtd");
  print("Valor total: R\$ $valorTotal");
}

// Exemplo de chamada da função
registrarVenda("Dipirona", 50);