<%@ page import="DAO.ProdutoDAO,DAO.CadastroDAO, DTO.Produto, java.sql.Connection, java.sql.DriverManager, java.util.List, DTO.Marca, DTO.Categoria" %>
<%
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velvet", "root", "");
    int id = Integer.parseInt(request.getParameter("id"));
    ProdutoDAO produtoDAO = new ProdutoDAO(conn);
    Produto produto = produtoDAO.buscarPorId(id);
    
    CadastroDAO cadastroDAO = new CadastroDAO();
    List<Marca> marcas = cadastroDAO.listarMarcas();
    List<Categoria> categorias = cadastroDAO.listarCategorias();

    request.setAttribute("produto", produto);
    request.setAttribute("marcas", marcas);
    request.setAttribute("categorias", categorias);
%>


<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/editarProduto.css">
</head>

<form method="POST" action="/Velvet_v2/atualizarProduto">
    <input type="hidden" name="id" value="<%= produto.getId_produto() %>">
    
    <label for="nomeProduto">Nome:</label>
    <input type="text" id="nomeProduto" name="nome" value="<%= produto.getNome() %>" required>
    
    <label for="marcaProduto">Marca:</label>
    <select id="marcaProduto" name="marca" required>
        <option value="">Selecione a marca</option>
        <% for (Marca marca : marcas) { %>
            <option value="<%= marca.getId_marca() %>" 
                <%= (marca.getId_marca() == produto.getMarca()) ? "selected" : "" %>>
                <%= marca.getNome() %>
            </option>
        <% } %>
    </select>
    
    <label for="precoCusto">Preço de custo:</label>
    <input type="text" id="precoCusto" name="custo" value="<%= produto.getCusto() %>" required>
    
    <label for="valorProduto">Valor:</label>
    <input type="text" id="valorProduto" name="valor" value="<%= produto.getValor() %>" required>
    
    <label for="tamanhoCaixa">Tamanho/Caixa:</label>
    <input type="text" id="tamanhoCaixa" name="tamanho" value="<%= produto.getTamanho() %>" required>
    
    <label for="categoriaProduto">Categorias:</label>
    <select id="categoriaProduto" name="categoria" required>
        <option value="">Selecione a categoria</option>
        <% for (Categoria categoria : categorias) { %>
            <option value="<%= categoria.getId() %>" 
                <%= (categoria.getId() == produto.getCategorias()) ? "selected" : "" %>>
                <%= categoria.getNome() %>
            </option>
        <% } %>
    </select>
    
    <label for="estoqueProduto">Estoque:</label>
    <input type="text" id="estoqueProduto" name="estoque" value="<%= produto.getEstoque() %>" required>
    
    <label for="statusProduto">Status:</label>
    <input type="text" id="statusProduto" name="status" value="<%= produto.getStatus() %>" required>
    
    <label for="descricaoProduto">Descrição:</label>
    <textarea id="descricaoProduto" name="desc" required><%= produto.getDesc() %></textarea>
    
    <button type="submit">Salvar Alterações</button>
</form>
