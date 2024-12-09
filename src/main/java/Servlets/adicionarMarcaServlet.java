package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import DAO.MarcaDAO;
import DTO.Marca;

@WebServlet("/cadastrarMarca")
public class adicionarMarcaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adicionarMarcaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");

            String nome = request.getParameter("nomeMarca");

            Marca marca = new Marca();
            marca.setNome(nome);

            MarcaDAO marcaDAO = new MarcaDAO();
            boolean sucesso = marcaDAO.adicionarMarca(marca);

            if (sucesso) {
            	response.sendRedirect("/Velvet_v2/adm/sucesso.jsp");
            } else {
                response.sendRedirect("marcaExistente.jsp");
            }

        } catch (Exception e) {
            response.sendRedirect("erro.jsp");
            e.printStackTrace();
        }
    }



}
