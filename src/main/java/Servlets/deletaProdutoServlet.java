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

import DAO.ProdutoDAO;
import DTO.Produto;

@WebServlet("/deletarProduto")
public class deletaProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

            Produto produto = new Produto();
            produto.setId_produto(id);
            
            Connection conn;
			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velvet", "root", "");
	            ProdutoDAO produtoDAO = new ProdutoDAO(conn);
	            if (produtoDAO.deletaProduto(produto)) {
	                response.sendRedirect("/Velvet_v2/listarProdutosADM"); // Redireciona para a página de listagem
	            } else {
	                response.getWriter().println("Erro ao deletar produto.");
	            }

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

           
    
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Opcional: Redireciona GET para POST se necessário
        doPost(request, response);
    }
}
