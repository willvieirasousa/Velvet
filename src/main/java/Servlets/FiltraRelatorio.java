package Servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DAO.RelatorioDAO;
import DTO.Relatorio;

@WebServlet("/FiltraRelatorio")
public class FiltraRelatorio extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FiltraRelatorio() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");

            String data = request.getParameter("data");
            
            
            Relatorio relatorio = new Relatorio();
            
            relatorio.setData(data);
            
            
            System.out.print(data);
            RelatorioDAO relatoriodao = new RelatorioDAO();
            
            int clientesCadastrados = relatoriodao.getTotalClienteData(relatorio.getData());
            int quantidadeProdutos = relatoriodao.contaProdutosData(relatorio.getData());
            int quantidadePedidos = relatoriodao.contaPedidosData(relatorio.getData());
            int estoque = relatoriodao.estoqueData(relatorio.getData());
            double totalVendas = relatoriodao.getTotalVendasData(relatorio.getData());
            int pedidosEntregues = relatoriodao.getProdutosEntreguesData(relatorio.getData());
            int quantidadeItensPedidos = relatoriodao.contaProdutosVendidosData(relatorio.getData());
            
            
            request.setAttribute("clientesCadastrados", clientesCadastrados); 
            request.setAttribute("quantidadeProdutos", quantidadeProdutos);
            request.setAttribute("quantidadePedidos", quantidadePedidos); 
            request.setAttribute("estoque", estoque); 
            request.setAttribute("totalVendas", totalVendas); 
            request.setAttribute("pedidosEntregues", pedidosEntregues); 
            request.setAttribute("quantidadeItensPedidos", quantidadeItensPedidos);
            
            request.getRequestDispatcher("adm/relatorio.jsp").forward(request, response);


        } catch (Exception e) {
            response.sendRedirect("erro.jsp");
            e.printStackTrace();
        }
    }
    
}
