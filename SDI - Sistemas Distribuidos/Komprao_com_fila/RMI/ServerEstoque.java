import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sdi.soap.client.IFornecedor;
import sdi.soap.client.ServerFornecedorImplService;

public class ServerEstoque extends UnicastRemoteObject implements IEstoque {

    private Map<String, Integer> estoque;
    private IFornecedor fornecedor;


    public ServerEstoque() throws RemoteException {
        super();
        estoque = new HashMap<>();
        carregarProdutosDoCsv("entrada_produtos.csv");
        conectarFornecedor("http://127.0.0.1:9876/WSFornecedor?wsdl");
      }

    private void carregarProdutosDoCsv(String arquivoCsv) {
        try (BufferedReader br = new BufferedReader(new FileReader(arquivoCsv))) {
            String linha;
            while ((linha = br.readLine()) != null) {
                if (linha.trim().isEmpty() || linha.startsWith("Codigo")) {
                    continue; // Ignora linhas vazias ou o cabeçalho
                }

                String[] campos = linha.split(";");
                if (campos.length >= 3) {
                    String codigo = campos[0].trim(); // Código do produto
                    int quantidade = Integer.parseInt(campos[2].trim()); // Quantidade

                    // Adiciona o produto ao estoque
                    estoque.put(codigo, quantidade);
                }
            }
        } catch (IOException e) {
            System.err.println("Erro ao carregar o arquivo CSV: " + e.getMessage());
        }
    }

    private void conectarFornecedor(String endpoint) {
        try {
            // URL do WSDL
            URL wsdlUrl = new URL(endpoint);

            // Criação do serviço SOAP
            ServerFornecedorImplService service = new ServerFornecedorImplService(wsdlUrl);

            // Obtenção da porta do serviço (interface do fornecedor)
            fornecedor = service.getServerFornecedorImplPort();

            System.out.println("Conectado ao fornecedor em: " + endpoint);
        } catch (Exception e) {
            System.err.println("Erro ao conectar ao fornecedor " + endpoint + ": " + e.getMessage());
        }

        if (fornecedor == null) {
            System.err.println("Nenhum fornecedor disponível no momento.");
        }
    }

    //@Override
    public synchronized Integer obter_e_remover_produto(String id) throws RemoteException {
        if (estoque.containsKey(id)) {
            Integer quantidade = estoque.get(id);
            if (quantidade > 0) {
                estoque.put(id, quantidade - 1);
                return quantidade;
            }
        }
        return null;
    }

    //@Override
    public List<String> listar_ids_disponiveis() throws RemoteException {
        return new ArrayList<>(estoque.keySet());
    }

    @Override
    public Integer remover_produto(String id) throws RemoteException {
        if (estoque.containsKey(id)) {
            Integer quantidade = estoque.get(id);
            if (quantidade > 0) {
                estoque.put(id, quantidade - 1);
                return quantidade - 1;
            }
        }
        return null;
    }

    @Override
    public String relatorio_produtos() throws RemoteException {
        StringBuilder relatorio = new StringBuilder();
        for (Map.Entry<String, Integer> entry : estoque.entrySet()) {
            relatorio.append("Produto: ").append(entry.getKey())
                     .append(" | Quantidade: ").append(entry.getValue()).append("\n");
        }
        return relatorio.toString();
    }

    public static void main(String[] args) {
        try {
            ServerEstoque estoqueServer = new ServerEstoque();
            Registry registry = LocateRegistry.createRegistry(2099);
            registry.rebind("ServidorEstoque", estoqueServer);
            System.out.println("Servidor de Estoque pronto!");
        } catch (Exception e) {
            System.err.println("Erro no Servidor de Estoque: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
