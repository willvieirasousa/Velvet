package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/adicionarCarrinho")
public class AdicionarCarrinhoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idProduto = Integer.parseInt(request.getParameter("idProduto"));
        String emailCliente = request.getParameter("emailCliente");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        double total = Double.parseDouble(request.getParameter("total"));

        String jdbcURL = "jdbc:mysql://localhost:3306/velvet";
        String dbUser = "root";
        String dbPassword = "";

        try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            String sql = "INSERT INTO carrinho (id_produto, email_cliente, quantidade, total) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, idProduto);
            statement.setString(2, emailCliente);
            statement.setInt(3, quantidade);
            statement.setDouble(4, total);

            statement.executeUpdate();
            response.sendRedirect("views/carrinho.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("erro.jsp");
        }
    }
}
