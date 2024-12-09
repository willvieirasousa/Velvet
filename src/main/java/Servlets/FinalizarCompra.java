package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import DAO.CadastroDAO;
import DAO.ConexaoDAO;
import DAO.EnderecoDAO;
import DAO.PagamentoDAO;
import DAO.PedidoDAO;
import DAO.ProdutoDAO;
import DTO.Endereco;
import DTO.ItemCarrinho;
import DTO.Pagamento;

@WebServlet("/FinalizarCompra")
public class FinalizarCompra extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	HttpSession session = request.getSession();
    	String emailCliente = (String) session.getAttribute("email");
    	
    	Connection conn = new ConexaoDAO().conectaBD();
    	CadastroDAO clienteDAO = new CadastroDAO();
    	int idCliente = 0;
    	try {
			idCliente = clienteDAO.buscarIdClientePorEmail(emailCliente);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	
        String Cidade = request.getParameter("cidade");
        int idClientes = idCliente;
        String logradouro = request.getParameter("logradouro");
        String bairro = request.getParameter("bairro");
        String cep = request.getParameter("cep");
        int numero = Integer.parseInt(request.getParameter("numero"));
        String complemento = request.getParameter("complemento");
        
        Endereco endereco = new Endereco();
        endereco.setCidade(Cidade);
        endereco.setId_clientes(idClientes);
        endereco.setLogradouro(logradouro);
        endereco.setBairro(bairro);
        endereco.setCep(cep);
        endereco.setNumero(numero);
        endereco.setComplemento(complemento);

        int idPedido = 1;
        //int valor = Integer.parseInt(request.getParameter("valor"));
        int valor = 100;

        String numeroCard = request.getParameter("numero_card");
        String dataVenc = request.getParameter("data_venc");
        String nomeTitular = request.getParameter("nome_titular");
        String cvv = request.getParameter("cvv");
        String metodo = "cartão";
        
        System.out.println("idPedido" + idPedido);
        System.out.println("valor" + valor);

    
        // Criação do DTO Pagamento
        Pagamento pagamento = new Pagamento();
        pagamento.setId_pedido(idPedido);
        pagamento.setValor(valor);
        pagamento.setNumero_card(numeroCard);
        pagamento.setData_venc(dataVenc);
        pagamento.setNome_titular(nomeTitular);
        pagamento.setCvv(cvv);
        pagamento.setMetodo(metodo);
        
        
        
        try (Connection connection = new ConexaoDAO().conectaBD()) {
            EnderecoDAO enderecoDAO = new EnderecoDAO(connection);
            enderecoDAO.inserirEndereco(endereco);

            PagamentoDAO pagamentoDAO = new PagamentoDAO(connection);
            pagamentoDAO.inserirPagamento(pagamento);
            
            PedidoDAO pedido = new PedidoDAO(connection);
            List<ItemCarrinho> carrinho = pedido.finalizarCompra(emailCliente);
             idPedido = pedido.inserirPedido(carrinho, emailCliente);
            pedido.limparCarrinho(emailCliente);
            
            
            request.setAttribute("idPedido", idPedido); 
            response.sendRedirect("/Velvet_v2/ConfirmacaoPedido?idPedido=" + idPedido);

        } catch (SQLException e) {
            throw new ServletException("Erro ao processar pagamento e endereço.", e);
        } catch (Exception e) {
			e.printStackTrace();
		}
    }
}
