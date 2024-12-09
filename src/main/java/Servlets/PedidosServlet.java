package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import DAO.ConexaoDAO;
import DAO.PedidoDAO;
import DAO.PedidoProdutoDAO;
import DAO.CadastroDAO;  // Importando o DAO de Cliente
import DTO.Pedido;
import DTO.ItemPedidoProduto;

@WebServlet("/PedidosServlet")
public class PedidosServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sessao = request.getSession();
        
        String email = (String) sessao.getAttribute("email");

        if (email == null || email.isEmpty()) {
            response.sendRedirect("login.jsp");
            return;
        }

        try (Connection connection = new ConexaoDAO().conectaBD()) {

        	CadastroDAO clienteDAO = new CadastroDAO();
            int idCliente = clienteDAO.buscarIdClientePorEmail(email);

            PedidoDAO pedidoDAO = new PedidoDAO(connection);
            List<Pedido> listaPedidos = pedidoDAO.buscarPedidosPorCliente(idCliente);

            PedidoProdutoDAO pedidoProdutoDAO = new PedidoProdutoDAO(connection);
            for (Pedido pedido : listaPedidos) {
                List<ItemPedidoProduto> itens = pedidoProdutoDAO.buscarProdutosDoPedido(pedido.getId_pedido());
                pedido.setItens(itens);  
                double total = 0;
                for (ItemPedidoProduto item : itens) {
                    total += item.getQuantidade() * item.getPrecoUnitario();
                }
                pedido.setTotal(total);
            }

            request.setAttribute("listaPedidos", listaPedidos);

            // Exibir no console para verificar se a lista está sendo passada corretamente
            System.out.println("Lista de Pedidos: " + listaPedidos);

            RequestDispatcher dispatcher = request.getRequestDispatcher("views/listadepedidos.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erro ao buscar dados.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("views/listadepedidos.jsp");
            dispatcher.forward(request, response);
        }
    }
}
