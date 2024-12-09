<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Produtos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_lista_prod.css">
</head>
<body>
    <!-- Sidebar -->
     <div class="sidebar" id="sidebar">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/assets/logo.png" alt="Logo">
        </div>
   <ul>
                <li><a href="/Velvet_v2/dados">HOME</a></li>
                <li><a href="/Velvet_v2/listarPedidos">PEDIDOS</a></li>
                <li><a href="/Velvet_v2/listarProdutosADM">PRODUTOS</a></li>
                <li><a href="/Velvet_v2/listarClientes">CLIENTES</a></li>
                <li><a href="/Velvet_v2/relatorio">RELATÓRIOS</a></li>
                <li><a href="adm/config.jsp">CONFIGURAÇÕES</a></li>
            </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h1>Lista de produtos:</h1>
            <button class="new-product-btn" onClick="window.location.href='/Velvet_v2/marcasCategorias'">+ NOVO PRODUTO</button>
        </div>

        <div class="product-list">
            <c:forEach var="produto" items="${produtos}">
                <div class="product-card">
                    <img src="./assets/${produto.imagem}" alt="${produto.nome}">
                    <h2 hidden>${produto.id_produto}</h2>
                    <h2>${produto.nome}</h2>
                    <p>${produto.desc}</p>
                    <ul>
                        <li><strong>Estoque:</strong> ${produto.estoque} unidades</li>
                        <li>
                            <strong>Status:</strong>
                            <span class="status ${produto.estoque == 0 ? 'fora-venda' : 'a-venda'}">
                                ${produto.estoque == 0 ? 'FORA DE ESTOQUE' : 'Em estoque'}
                            </span>
                        </li>
                        <li>
                            <strong>Status:</strong>
                            <span class="status">
                                ${produto.status == 0 ? 'Fora de Venda' : 'À venda'}
                            </span>
                        </li>
                        <li><strong>Categorias:</strong> ${produto.categorias}</li>
                    </ul>
                    
                    <h3>R$ ${produto.valor}</h3>
                    
                    <div class="actions">
                        <!-- Formulário para deletar -->
                        <form action="deletarProduto" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="${produto.id_produto}">
                            <button type="submit" class="delete-btn">🗑️</button>
                        </form>
                        <!-- Botão para editar -->
                        <button class="edit-btn" onClick="window.location.href='views/editar_produto.jsp?id=${produto.id_produto}'">✏️</button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>