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

@WebServlet("/excluirItemCarrinho")
public class ExcluirItemCarrinhoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idProduto = Integer.parseInt(request.getParameter("idProduto"));
        String emailCliente = request.getParameter("emailCliente");

        String jdbcURL = "jdbc:mysql://localhost:3306/velvet";
        String dbUser = "root";
        String dbPassword = "";

        try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            String sql = "DELETE FROM carrinho WHERE id_produto = ? AND email_cliente = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, idProduto);
            statement.setString(2, emailCliente);

            int rowsDeleted = statement.executeUpdate();

            if (rowsDeleted > 0) {
                System.out.println("Item excluído com sucesso.");
            }
            response.sendRedirect("views/carrinho.jsp"); 
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("erro.jsp");
        }
    }
}
