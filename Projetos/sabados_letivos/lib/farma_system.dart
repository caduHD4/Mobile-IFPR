//Duas funções sem retorno e sem parâmetro:
// Função para exibir mensagem de boas-vindas
void exibirMensagemDeBoasVindas() {
  print("Bem-vindo(a) ao sistema Farma System!");
}

// Função para exibir mensagem de encerramento
void exibirMensagemDeEncerramento() {
  print("Obrigado por utilizar o sistema da Farma System. Até!");
}

////////////////////////////////////////////////////////////////////////////////

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
String nomeProduto = "Dipirona";
int quantidadeEmEstoque = 100;
double precoUnitario = 5.99;

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

////////////////////////////////////////////////////////////////////////////////

//Duas funções com retorno e sem parâmetro:
Map<String, int> produtos = {
  "Dipirona": 0,
  "Paracetamol": 50,
  "Omeprazol": 75,
  "Amoxicilina": 40
};

// Função para verificar o estoque total da farmácia
void verificarEstoqueTotal() {
  int total = 0;

  // Percorrer o cadastro de produtos e somar as quantidades em estoque
  for (var produto in produtos.entries) {
    total += produto.value;
  }

  // Exibir a quantidade total em estoque
  print("Estoque total da farmácia: $total unidades");
}

// Dados das vendas realizadas
List<double> vendas = [150.0, 120.5, 80.25, 50.75];

// Função para obter a receita total da farmácia
double obterReceitaTotal() {
  double total = 0;

  // Percorrer a lista de vendas e somar os valores
  for (var venda in vendas) {
    total += venda;
  }

  // Retornar o valor total das vendas
  return total;
}

////////////////////////////////////////////////////////////////////////////////

//Duas funções com retorno e com parâmetro:
// Função para verificar se um produto está em estoque
bool verificarProdutoEmEstoque(String nomeProduto) {
  // Verificar se o produto existe no cadastro
  if (produtos.containsKey(nomeProduto)) {
    // Verificar se há pelo menos uma unidade do produto em estoque
    if (produtos[nomeProduto]! > 0) {
      return true;
    }
  }

  // Caso o produto não exista no cadastro ou não tenha estoque, retornar falso
  return false;
}

double obterPrecoUnitario(
    String nomeProduto, List<Map<String, dynamic>> estoque) {
  // percorre o estoque em busca do produto com o nome informado
  for (var produto in estoque) {
    if (produto['nome'] == nomeProduto) {
      return produto['preco'];
    }
  }
  // caso não encontre o produto, retorna 0
  return 0;
}

////////////////////////////////////////////////////////////////////////////////

//Duas funções com parâmetros opcionais (com o devido contexto):
// Função para atualizar o estoque de um produto
double? calcularPrecoTotal({required String produto, int quantidade = 1, double? desconto}) {
  double? precoUnitario = produtos[produto] as double?;
  if (precoUnitario == null) {
    print('Produto não encontrado no estoque.');
    return null;
  }
  
  double precoTotal = precoUnitario * quantidade;
  if (desconto != null) {
    precoTotal -= desconto;
  }
  
  return precoTotal;
}


// Função para calcular o valor total de uma venda
double calcularTotal(double valorProduto,
    {double desconto = 0, double acrescimo = 0}) {
  double valorTotal = valorProduto;

  // Verificar se há desconto e/ou acréscimo
  if (desconto > 0) {
    valorTotal -= (valorProduto * desconto) / 100;
  }

  if (acrescimo > 0) {
    valorTotal += (valorProduto * acrescimo) / 100;
  }

  return valorTotal;
}

////////////////////////////////////////////////////////////////////////////////
///Duas funções com parâmetros nomeados
// Função para cadastrar um novo produto no estoque

void cadastrarProduto2({required String nome, required double preco, int quantidade = 0, String fabricante = ""}) {
  print("Produto cadastrado:");
  print("Nome: $nome");
  print("Preço: R\$ $preco");
  print("Quantidade: $quantidade");
  print("Fabricante: $fabricante");
}

// Função para registrar uma venda
void registrarVenda2({required String nomeProduto, int quantidade = 1, String nomeCliente = ""}) {
  print("Venda registrada:");
  print("Produto: $nomeProduto");
  print("Quantidade: $quantidade");
  print("Cliente: $nomeCliente");
}



