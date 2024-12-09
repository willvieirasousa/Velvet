package Servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import DAO.CadastroDAO;
import DTO.Categoria;
import DTO.Marca;
import DTO.Produto;

/**
 * Servlet implementation class adicionarCadastro_produtos
 */
@WebServlet("/adicionarCadastro_produtos")
public class adicionarCadastro_produtos extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public adicionarCadastro_produtos() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");

            String nome = request.getParameter("nome");
            String valor = request.getParameter("valor");
            String custo = request.getParameter("custo");
            String desc = request.getParameter("desc");
            String tamanho = request.getParameter("tamanho");
            String conteudo = request.getParameter("conteudo");
            String imagem = request.getParameter("imagem");
            String estoque = request.getParameter("estoque");
            String status = request.getParameter("status");
            
            String marcaId = request.getParameter("marca");
            String categoriaId = request.getParameter("categoria");


            
            String data = LocalDate.now().format(DateTimeFormatter.ISO_LOCAL_DATE);
            System.out.println(data);

            Produto produto = new Produto();
            produto.setNome(nome);
            produto.setValor(valor);
            produto.setCusto(custo);
            produto.setDesc(desc);
            produto.setTamanho(tamanho);
            produto.setConteudo(conteudo);
            produto.setImagem(imagem);
            produto.setEstoque(estoque);
            produto.setCriacao(data);
            produto.setStatus(status);
            produto.setCategorias(Integer.parseInt(categoriaId));
            produto.setMarca(Integer.parseInt(marcaId));
           
            CadastroDAO cadastroDAO = new CadastroDAO();
            List<Marca> marcas = cadastroDAO.listarMarcas();
            List<Categoria> categorias = cadastroDAO.listarCategorias();

            request.setAttribute("marcas", marcas);
            request.setAttribute("categorias", categorias);
     
            
            CadastroDAO cadastrodao = new CadastroDAO();
            cadastrodao.adicionarCadastroProduto(produto);

            response.sendRedirect("/Velvet_v2/listarProdutosADM");

        } catch (Exception e) {
            response.sendRedirect("erro.jsp");
            e.printStackTrace();
        }
    }
}
