package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DAO.RelatorioDAO;

@WebServlet(urlPatterns = {"/relatorio", "/dados"})


public class RelatorioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RelatorioDAO dao = new RelatorioDAO();
        int quantidadeProdutos = dao.contaProdutos();
        int quantidadePedidos = dao.contaPedidos();
        int estoque = dao.estoque();
        double totalVendas = dao.getTotalVendas();
        int clientesCadastrados = dao.getTotalCliente();
        int pedidosEntregues = dao.getProdutosEntregues();
        int estrelas = dao.getTotalEstrelas();
        int avaliacoes = dao.getAvaliacoes();
        double satisfacao = estrelas / avaliacoes;
        int quantidadeItensPedidos = dao.contaProdutosVendidos();
        
        System.out.println(estrelas);
        System.out.println(avaliacoes);
        

        request.setAttribute("quantidadeProdutos", quantidadeProdutos);        
        request.setAttribute("quantidadePedidos", quantidadePedidos);
        request.setAttribute("estoque", estoque);   
        request.setAttribute("totalVendas", totalVendas);    
        request.setAttribute("clientesCadastrados", clientesCadastrados); 
        request.setAttribute("pedidosEntregues", pedidosEntregues);
        request.setAttribute("estrelas", estrelas);
        request.setAttribute("avaliacoes", avaliacoes);
        request.setAttribute("satisfacao", satisfacao);
        request.setAttribute("quantidadeItensPedidos", quantidadeItensPedidos);
        
        
        String path = request.getServletPath();
        System.out.println(path);
        
        if ("/relatorio".equals(path)) {
        	request.getRequestDispatcher("adm/relatorio.jsp").forward(request, response);
        } else if ("/dados".equals(path)) {
        	request.getRequestDispatcher("adm/AdmHome.jsp").forward(request, response);
        }
        
        
        
    }
}

