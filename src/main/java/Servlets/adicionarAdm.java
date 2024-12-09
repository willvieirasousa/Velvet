package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DAO.AdmDAO;
import DTO.Adm;



@WebServlet("/cadastrarAdmin")
/**
 * Servlet implementation class adicionarAdm
 */
public class adicionarAdm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()   
     */
    public adicionarAdm() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");

            String nome = request.getParameter("adminNome");
            String email = request.getParameter("adminEmail");
            String senha = request.getParameter("adminSenha");
            int status = Integer.parseInt(request.getParameter("status"));

            Adm adm = new Adm();
            adm.setNome(nome);
            adm.setEmail(email);
            adm.setSenha(senha);
            adm.setStatus(status);

            AdmDAO admDAO = new AdmDAO();
            boolean sucesso = admDAO.adicionarAdm(adm);
            		
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
