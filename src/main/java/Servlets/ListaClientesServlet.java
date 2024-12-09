package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DTO.Clientes;
import DAO.ClienteDAO;

@WebServlet("/listarClientes")
public class ListaClientesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velvet", "root", "");

        	
            ClienteDAO clienteDAO = new ClienteDAO(conn);
            List<Clientes> cliente = clienteDAO.listarClientes();

            request.setAttribute("clientes", cliente);
            request.getRequestDispatcher("adm/clientes.jsp").forward(request, response);

            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar o banco de dados.");
        }
    }
}
