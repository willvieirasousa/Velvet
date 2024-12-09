package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import DAO.ConexaoDAO;
import DAO.PedidoDAO;
import DTO.ItemPedidoProduto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ConfirmacaoPedido")
public class ConfirmacaoPedido extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ConfirmacaoPedido() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try (Connection connection = new ConexaoDAO().conectaBD()) {
            PedidoDAO pedidoDAO = new PedidoDAO(connection);
            
            Integer idPedido = Integer.parseInt(request.getParameter("idPedido"));
            
            List<ItemPedidoProduto> itensPedido = pedidoDAO.getItensPedido(idPedido);
            String codigoRastreio = pedidoDAO.getCodigoRastreio(idPedido);
            
            double totalPedido = 0.0;
            for (ItemPedidoProduto item : itensPedido) {
                totalPedido += item.getPrecoUnitario() * item.getQuantidade();
                
                int idProduto = item.getIdProduto();
                int quantidade = item.getQuantidade();

                if (!atualizarEstoque(connection, idProduto, 1)) {
                    throw new ServletException("Erro ao atualizar o estoque do produto: " + idProduto);
                }
            }

            request.setAttribute("itensPedido", itensPedido);
            request.setAttribute("codigoRastreio", codigoRastreio);
            request.setAttribute("idPedido", idPedido);
            request.setAttribute("totalPedido", totalPedido);

            request.getRequestDispatcher("views/pedidoconfirmado.jsp").forward(request, response);
        } catch (SQLException | NumberFormatException e) {
            throw new ServletException("Erro ao buscar informações do pedido.", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }

    private boolean atualizarEstoque(Connection connection, int idProduto, int quantidade) throws SQLException {
        String sql = "UPDATE produtos SET estoque = estoque - ? WHERE id_produto = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, quantidade);  
            statement.setInt(2, idProduto);   
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;  
        }
    }
}