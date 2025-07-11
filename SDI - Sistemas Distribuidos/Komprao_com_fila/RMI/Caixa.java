import java.rmi.Naming;
import java.rmi.RemoteException;

/*
    Caixa é o programa que irá consumir as operações do Servidor.
    Caixa não pode falar diretamente com Estoque.
 */


public class Caixa {
    private IServidor servidor;

    public Caixa() {
        try {
            // Localiza o servidor RMI
            servidor = (IServidor) Naming.lookup("//localhost/Servidor");
        } catch (Exception e) {
            System.out.println("Erro ao conectar com o servidor RMI: " + e);
        }
    }

    // Inicializa a venda para um cliente
    public boolean inicializarVenda(String cliente) {
        try {
            return servidor.inicializar_venda(cliente);
        } catch (RemoteException e) {
            System.out.println("Erro ao inicializar a venda: " + e);
            return false;
        }
    }

    // Registra um produto e retorna o valor total da compra
    public double registrarProduto(String id, String cliente) {
        try {
            return servidor.registrar_produto(id, cliente);
        } catch (RemoteException e) {
            System.out.println("Erro ao registrar produto: " + e);
            return 0;
        }
    }

    // Consulta o valor total da compra
    public double consultarValorTotal(String cliente) {
        try {
            return servidor.consultar_valor_total(cliente);
        } catch (RemoteException e) {
            System.out.println("Erro ao consultar valor total: " + e);
            return 0;
        }
    }

    // Efetua o pagamento final
    public boolean efetuarPagamento(String cliente, double valor) {
        try {
            return servidor.pagar(cliente, valor);
        } catch (RemoteException e) {
            System.out.println("Erro ao efetuar pagamento: " + e);
            return false;
        }
    }

    public static void main(String[] args) {
        Caixa caixa = new Caixa();
        String cliente = "Cliente1";

        // Inicializa uma venda
        if (caixa.inicializarVenda(cliente)) {
            System.out.println("Venda iniciada para o cliente " + cliente);

            // Registra produtos na venda
            caixa.registrarProduto("Produto1", cliente);
            caixa.registrarProduto("Produto2", cliente);

            // Consulta o valor total da venda
            double total = caixa.consultarValorTotal(cliente);
            System.out.println("Valor total da venda: " + total);

            // Efetua o pagamento
            if (caixa.efetuarPagamento(cliente, total)) {
                System.out.println("Pagamento efetuado com sucesso!");
            } else {
                System.out.println("Pagamento falhou.");
            }
        } else {
            System.out.println("Não foi possível iniciar a venda.");
        }
    }
}
