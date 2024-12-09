package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import DAO.CadastroDAO;
import DTO.Categoria;
import DTO.Marca;

@WebServlet("/marcasCategorias")
public class MarcasCategorias extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarcasCategorias() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    CadastroDAO cadastroDAO = new CadastroDAO();

    try {
        List<Marca> marcas = cadastroDAO.listarMarcas();
        List<Categoria> categorias = cadastroDAO.listarCategorias();

        request.setAttribute("marcas", marcas);
        request.setAttribute("categorias", categorias);

        // Encaminhar a requisição para o JSP
        request.getRequestDispatcher("/views/cadastro_produtos.jsp").forward(request, response);

    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("erro.jsp"); // Redireciona para uma página de erro em caso de falha
    }
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
