<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
    
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Novo Produto</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_cadastro_prod.css">
</head>
<body>
    <!-- Navbar lateral (adicione o código da navbar aqui) -->

    <div class="container-principal">
        <h1 class="titulo">Novo Produto:</h1>
        <form method="POST" action="${pageContext.request.contextPath}/adicionarCadastro_produtos">
        <div class="formulario-produto">
            <div class="imagem-produto">
                <label for="uploadImagem">Upload da imagem</label>
                <input type="file" id="uploadImagem" name="imagem" accept="image/*" required>
            </div>

            <div class="campos">
                <div class="campo">
                    <label for="nomeProduto">Nome:</label>
                    <input type="text" id="nomeProduto" name="nome" placeholder="Digite o nome do produto." required>
                </div>

                <div class="campo">
                    <label for="marcaProduto">Marca:</label>
                    <select id="marcaProduto" name="marca" required>
                        <option>Selecione a marca do produto</option>
                        <!-- Itera sobre as marcas -->
                        <c:forEach var="marca" items="${marcas}">
                            <option value="${marca.id_marca}">${marca.nome}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="campo">
                    <label for="precoCusto">Preço de custo:</label>
                    <input type="text" id="precoCusto" name="custo" placeholder="R$ 00,00" required>
                </div>

                <div class="campo">
                    <label for="valorProduto">Valor:</label>
                    <input type="text" id="valorProduto" name="valor" placeholder="R$ 00,00" required>
                </div>

                <div class="campo">
                    <label for="tamanhoCaixa">Tamanho/Caixa:</label>
                    <input type="text" id="tamanhoCaixa" name="tamanho" placeholder="0 cm" required>
                </div>

                <div class="campo">
                    <label for="categoriaProduto">Categorias:</label>
                    <select id="categoriaProduto" name="categoria" required>
                        <option>Selecione a categoria do produto</option>
                        <c:forEach var="categoria" items="${categorias}">
                            <option value="${categoria.id}">${categoria.nome}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="campo">
                    <label for="conteudoProduto">Conteúdo:</label>
                    <input type="text" id="conteudoProduto" name="conteudo" placeholder="0 ml" required>
                </div>

                <div class="campo">
                    <label for="estoqueProduto">Estoque:</label>
                    <input type="text" id="estoqueProduto" name="estoque" placeholder="0 Unidades" required>
                </div>

                <div class="campo">
                    <label for="descricaoProduto">Descrição:</label>
                    <textarea id="descricaoProduto" name="desc" placeholder="Descrição do produto." required></textarea>
                </div>
                
                <div class="campo">
                    <label for="status">Status:</label>
                    <input type="text" id="status" name="status" placeholder="0(Inativo) e 1(Ativo)" required>
                </div>
            </div>
        </div>

        <button class="botao-confirmar">
            <span>+ CONFIRMAR</span>
        </button>
        </form>
    </div>
</body>
</html>
    

<!--<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de produtos</title>
</head>
<body>
	<h1>Novo produto</h1>
	<form method="POST" action="${pageContext.request.contextPath}/adicionarCadastro_produtos">
		<label for="imagem">Foto</label>
		<input type="file" id="imagem" name="imagem" required>
		
		<label for="nome">Nome</label>
		<input type="text" id="nome" name="nome" required>
		
		<label for="marca">Marca:</label>
	    <select id="marca" name="marca">
	        <option>Selecione a marca do produto</option>
	        <c:forEach var="marca" items="${marcas}">
	            <option value="${marca.id_marca}">${marca.nome}</option>
	        </c:forEach>
	    </select>
		
		<label for="custo">Preço de custo</label>
		<input type="text" id="custo" name="custo" required>
		
		<label for="valor">Valor</label>
		<input type="text" id="valor" name="valor" required>
		
		<label for="tamanho">Tamanho caixa</label>
		<input type="text" id="tamanho" name="tamanho" required>
		

		<label for="categorias">Categorias</label>
		<input type="text" id="categorias" name="categorias" required>
		
		<label for="conteudo">Conteudo</label>
		<input type="text" id="conteudo" name="conteudo" required>
		
		<label for="desc">Descricao</label>
		<textarea id="desc" rows="3" cols="10" name="desc" required></textarea>
		
		
		
		<input type="submit" value="CONFIRMAR">
	</form>
</body>
</html> -->