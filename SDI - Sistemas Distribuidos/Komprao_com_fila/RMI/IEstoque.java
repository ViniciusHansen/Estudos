import java.rmi.Remote;
import java.rmi.RemoteException;

/*
 * O controle de estoque é responsável por anotar quais produtos foram vendidos e por entregar um relatório
 * ao final da execução.
 */

public interface IEstoque extends Remote {
    /* retorna a quantidade de produtos disponíveis após a remoção */
    public Integer remover_produto(String id) throws RemoteException;
    /* retorna um relatório de produtos - controle de estoque */
    public String relatorio_produtos() throws RemoteException;
}
