package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import DAO.PedidoAdmDAO;
import DTO.PedidoAdm;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/listarPedidos")
public class ListaPedidosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velvet", "root", "");

            PedidoAdmDAO pedidoDAO = new PedidoAdmDAO(conn);
            List<PedidoAdm> pedidos = pedidoDAO.listarPedidos();

            request.setAttribute("pedidos", pedidos);
            request.getRequestDispatcher("adm/pedidos.jsp").forward(request, response);

            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar o banco de dados.");
        }
    }
}
