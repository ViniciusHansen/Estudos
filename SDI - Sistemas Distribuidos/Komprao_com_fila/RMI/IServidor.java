import java.rmi.Remote;
import java.rmi.RemoteException;
 
/*
 * O Servidor é responsável por atender aos registros do caixa.
 * O Servidor controla a lista de produtos que devem ser pagos.
 * Servidor deve consultar Estoque após o pagamento.
 */

public interface IServidor extends Remote {
    /* Aviso para o servidor preparar um novo espaço em memória para armazenar as compras do cliente */
    public Boolean inicializar_venda(String cliente) throws RemoteException;
    /* Registro de venda de um produto. Retorna o valor total da compra até o momento. */
    public double registrar_produto(String id, String cliente) throws RemoteException;
    /* Consulta valor total */
    public double consultar_valor_total(String cliente) throws RemoteException;
    /* Efetua o pagamento final.
     * Após o pagamento, o servidor deve invocar o controle de estoque.
    */

    public Boolean pagar(String cliente, double valor) throws RemoteException;
}
