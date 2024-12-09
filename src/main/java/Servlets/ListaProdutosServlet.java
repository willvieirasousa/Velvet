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
import jakarta.servlet.http.HttpSession;
import DTO.Produto;
import DAO.ProdutoDAO;

@WebServlet(name = "listarProdutos", urlPatterns = { 
	    "/lancamentos", "/promocoes", "/masculino", "/feminino", "/aromas", "/neutros", "/citricos", "/listar"})
	public class ListaProdutosServlet extends HttpServlet {

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String path = request.getServletPath();
	        System.out.println("Servlet chamado com path: " + path);

	        if ("/lancamentos".equals(path)) {
	            listarLancamentos(request, response);
	        } else if("/promocoes".equals(path)){
	            listarPromocoes(request, response);
	        } else if("/masculino".equals(path)) {
	            listarMasculino(request, response);
	        } else if("/feminino".equals(path)){
	            listarFeminino(request, response);
	        } else if("/aromas".equals(path)) {
	            listarAromas(request, response);
	        } else if("/neutros".equals(path)) {
	            listarNeutros(request, response);
	        } else if("/citricos".equals(path)) {
	            listarCitricos(request, response);
	        } else if("/listar".equals(path)) {
	            listar(request, response);  
	        }
	    }
	    
	    private void listarLancamentos(HttpServletRequest request, HttpServletResponse response)
	            throws IOException, ServletException {
	        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velvet", "root", "")) {
	            ProdutoDAO produtoDAO = new ProdutoDAO(conn);
	            List<Produto> produtos = produtoDAO.listarProdutos(1);
	            request.setAttribute("produtos", produtos);
	            request.getRequestDispatcher("views/categorias.jsp").forward(request, response);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar o banco de dados.");
	        }
	    }

	    private void listarPromocoes(HttpServletRequest request, HttpServletResponse response)
	            throws IOException, ServletException {
	        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velvet", "root", "")) {
	            ProdutoDAO produtoDAO = new ProdutoDAO(conn);
	            List<Produto> produtos = produtoDAO.listarProdutos(2);
	            request.setAttribute("produtos", produtos);
	            request.getRequestDispatcher("views/categorias.jsp").forward(request, response);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar o banco de dados.");
	        }
	    }

	    private void listarMasculino(HttpServletRequest request, HttpServletResponse response)
	            throws IOException, ServletException {
	        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velvet", "root", "")) {
	            ProdutoDAO produtoDAO = new ProdutoDAO(conn);
	            List<Produto> produtos = produtoDAO.listarProdutos(3);
	            request.setAttribute("produtos", produtos);
	            request.getRequestDispatcher("views/categorias.jsp").forward(request, response);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar o banco de dados.");
	        }
	    }

	    private void listarFeminino(HttpServletRequest request, HttpServletResponse response)
	            throws IOException, ServletException {
	        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velvet", "root", "")) {
	            ProdutoDAO produtoDAO = new ProdutoDAO(conn);
	            List<Produto> produtos = produtoDAO.listarProdutos(4);
	            request.setAttribute("produtos", produtos);
	            request.getRequestDispatcher("views/categorias.jsp").forward(request, response);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar o banco de dados.");
	        }
	    }

	    private void listarAromas(HttpServletRequest request, HttpServletResponse response)
	            throws IOException, ServletException {
	        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velvet", "root", "")) {
	            ProdutoDAO produtoDAO = new ProdutoDAO(conn);
	            List<Produto> produtos = produtoDAO.listarProdutos(5);  
	            request.setAttribute("produtos", produtos);
	            request.getRequestDispatcher("views/categorias.jsp").forward(request, response);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar o banco de dados.");
	        }
	    }

	    private void listarNeutros(HttpServletRequest request, HttpServletResponse response)
	            throws IOException, ServletException {
	        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velvet", "root", "")) {
	            ProdutoDAO produtoDAO = new ProdutoDAO(conn);
	            List<Produto> produtos = produtoDAO.listarProdutos(6);  
	            request.setAttribute("produtos", produtos);
	            request.getRequestDispatcher("views/categorias.jsp").forward(request, response);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar o banco de dados.");
	        }
	    }

	    private void listarCitricos(HttpServletRequest request, HttpServletResponse response)
	            throws IOException, ServletException {
	        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velvet", "root", "")) {
	            ProdutoDAO produtoDAO = new ProdutoDAO(conn);
	            List<Produto> produtos = produtoDAO.listarProdutos(7);  
	            request.setAttribute("produtos", produtos);
	            request.getRequestDispatcher("views/categorias.jsp").forward(request, response);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar o banco de dados.");
	        }
	    }
	    
	    private void listar(HttpServletRequest request, HttpServletResponse response)
	            throws IOException, ServletException {
	        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velvet", "root", "")) {
	            ProdutoDAO produtoDAO = new ProdutoDAO(conn);
	            List<Produto> produtos = produtoDAO.listarTodos();
	            request.setAttribute("produtos", produtos);
	            request.getRequestDispatcher("views/index.jsp").forward(request, response);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar o banco de dados.");
	        }
	    }
	}
