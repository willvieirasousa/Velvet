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

@WebServlet("/atualizarProduto")

public class AtualizarProdutoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int id = Integer.parseInt(request.getParameter("id"));
		String nome = request.getParameter("nome");
		
		System.out.println(nome);		
		int marca = Integer.parseInt(request.getParameter("marca"));
		String precoCusto = request.getParameter("custo");
		String valor = request.getParameter("valor");
		String tamanho = request.getParameter("tamanho");
		int categoria = Integer.parseInt(request.getParameter("categoria"));
		String estoque = request.getParameter("estoque");
		String descricao = request.getParameter("desc");
		String status = request.getParameter("status");
		
		Produto produto = new Produto();
		produto.setId_produto(id);
	    produto.setNome(nome);
	    produto.setMarca(marca);
	    produto.setCusto(precoCusto);
	    produto.setValor(valor);
	    produto.setTamanho(tamanho);
	    produto.setCategorias(categoria);
	    produto.setEstoque(estoque);
	    produto.setDesc(descricao);
	    produto.setStatus(status);
	    
	    Connection conn;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velvet", "root", "");
			ProdutoDAO produtoDAO = new ProdutoDAO(conn);
			if (produtoDAO.atualizaProduto(produto)) {
				response.sendRedirect("/Velvet_v2/listarProdutosADM");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	
	}
	
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
