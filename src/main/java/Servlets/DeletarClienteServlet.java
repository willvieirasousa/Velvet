package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import DAO.ClienteDAO;
import DTO.Clientes;

@WebServlet("/DeletarClienteServlet")

public class DeletarClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velvet", "root", "");
            
            String idParam = request.getParameter("id");
            
            int id = Integer.parseInt(idParam);
            
            //int id = Integer.parseInt(request.getParameter("id_cliente"));
            System.out.println(id);
    		
    		Clientes clientes = new Clientes();
    		

    		ClienteDAO clienteDAO = new ClienteDAO(conn);
    		clienteDAO.deletarClientes(id);

            request.setAttribute("clientes", clientes);
            request.getRequestDispatcher("/listarClientes").forward(request, response);

            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar o banco de dados.");
        }
    
    }
}
