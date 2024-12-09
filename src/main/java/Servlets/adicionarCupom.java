package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DAO.CupomDAO;
import DAO.MarcaDAO;
import DTO.Cupom;
import DTO.Marca;



@WebServlet("/cadastrarCupom")
/**
 * Servlet implementation class adicionarCupom
 */
public class adicionarCupom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adicionarCupom() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");

            String nome = request.getParameter("cupomCodigo");
            Double valor = Double.parseDouble(request.getParameter("valor"));

            Cupom cupom = new Cupom();
            cupom.setCod_cupom(nome);
            cupom.setValor(valor);

            CupomDAO cupomDAO = new CupomDAO();
            boolean sucesso = cupomDAO.adicionarCupom(cupom);

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
