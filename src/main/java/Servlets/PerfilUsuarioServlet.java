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
import DAO.ConexaoDAO;
import DAO.CadastroDAO;
import DAO.EnderecoDAO;
import DTO.Cadastro;
import DTO.Endereco;

@WebServlet("/PerfilUsuario")
public class PerfilUsuarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PerfilUsuarioServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("email") == null || session.getAttribute("email").equals("")) {
            response.sendRedirect("views/login.jsp"); 
            return;
        }

        String email = (String) session.getAttribute("email");

        try (Connection conn = new ConexaoDAO().conectaBD()) {
        	CadastroDAO clienteDAO = new CadastroDAO();
        	Cadastro cliente = clienteDAO.getClienteByEmail(email);

            EnderecoDAO enderecoDAO = new EnderecoDAO(conn);
            Endereco endereco = enderecoDAO.getEnderecoByCliente(cliente.getId_cliente());

            request.setAttribute("cliente", cliente);
            request.setAttribute("endereco", endereco);
            System.out.println("oCLIENTE: " + cliente);

            request.getRequestDispatcher("views/perfilUsuario.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Erro ao buscar informações do perfil do usuário.", e);
        }
    }
}

