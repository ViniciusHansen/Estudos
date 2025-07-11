/*
 * Implementação do Servidor de caixa.
  */

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.HashMap;
import java.util.Map;

public class ServerServidor extends UnicastRemoteObject implements IServidor {

  private Map<String, Map<String, Double>> vendas; // Mapa de vendas por cliente
  private IEstoque estoque; // Referência para o controle de estoque

  public ServerServidor(IEstoque estoque) throws RemoteException {
        super();
        this.estoque = estoque;
        this.vendas = new HashMap<>();
    }

  @Override
  public Boolean inicializar_venda(String cliente) throws RemoteException {
    if (vendas.containsKey(cliente)) {
        return false; // Já existe uma venda em andamento para o cliente
    }
    vendas.put(cliente, new HashMap<>());
    return true; // Venda inicializada com sucesso
  }

  @Override
  public double registrar_produto(String id, String cliente) throws RemoteException {
    if (!vendas.containsKey(cliente)) {
      throw new RemoteException("Venda não inicializada para o cliente.");
    }

    Map<String, Double> produtosVenda = vendas.get(cliente);
    double precoProduto = 0; // Defina como desejar: pode ser de um banco de dados, ou outro controle
    switch (id) {
        case "Produto1":
            precoProduto = 10.99;
            break;
        case "Produto2":
            precoProduto = 15.49;
            break;
        case "Produto3":
            precoProduto = 23.75;
            break;
        // Adicione outros produtos aqui
    }
    
    produtosVenda.put(id, precoProduto);
    return consultar_valor_total(cliente); // Retorna o valor total da venda
  }

  @Override
  public double consultar_valor_total(String cliente) throws RemoteException {
    // TODO Auto-generated method stub
    if (!vendas.containsKey(cliente)) {
        throw new RemoteException("Venda não inicializada para o cliente.");
    }

    double total = 0;
    Map<String, Double> produtosVenda = vendas.get(cliente);
    for (Double preco : produtosVenda.values()) {
        total += preco;
    }
    return total;
  }

  @Override
  public Boolean pagar(String cliente, double valor) throws RemoteException {
    if (!vendas.containsKey(cliente)) {
      throw new RemoteException("Venda não inicializada para o cliente.");
    }

    double totalVenda = consultar_valor_total(cliente);
    if (valor < totalVenda) {
        return false; // Valor insuficiente para o pagamento
    }

    // Efetua o pagamento e consulta o estoque
    Map<String, Double> produtosVenda = vendas.get(cliente);
    for (String produtoId : produtosVenda.keySet()) {
        Integer quantidadeRestante = estoque.remover_produto(produtoId);
        if (quantidadeRestante == null || quantidadeRestante < 0) {
            return false; // Se algum produto não estiver disponível
        }
    }

    vendas.remove(cliente); // Finaliza a venda e remove do mapa
    return true; // Pagamento efetuado e estoque atualizado
  }
    
}
