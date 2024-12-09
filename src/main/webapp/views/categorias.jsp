<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Grid de Produtos</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/categorias.css">
<script>
function comprarProduto(id) {
    fetch(`/Velvet_v2/detalheProduto?id=${id}`, {  // Corrigido com as aspas na URL
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        }
    })
    .then(response => {
        if (response.ok) {
            return response.text();
        } else {
            throw new Error("Erro ao adicionar o produto ao carrinho.");
        }
    })
    .then(data => {
        alert(data); // Mostra uma mensagem de sucesso
    })
    .catch(error => {
        console.error("Erro:", error);
        alert("Não foi possível adicionar o produto ao carrinho.");
    });
}
</script>
</head>

<body>

	<header>
    <div class="container-geral-header">
        <div class="box-logo">
            <a href="/Velvet_v2/listar"><img class="logo" src="${pageContext.request.contextPath}/assets/logo.png" alt="Logo"></a>
        </div>
        <div class="box-pesquisa">
            <input type="text" placeholder="Pesquisa..." />
            <button class="box-icon">
                <ion-icon class="icone-icone" name="search-outline"></ion-icon>
            </button>
        </div>
        <div class="box-usuario">
            <a href="/Velvet_v2/PerfilUsuario">Minha Conta</a>
            <a href="/Velvet_v2/views/cadastro.jsp">Cadastre-se</a>
        </div>
        <div class="box-carrinho">
            <a href="./carrinho.jsp">
                <ion-icon class="icone-icone" name="bag-handle-outline"></ion-icon>
            </a>
        </div>
        <div class="menu-hamburger">
            <button class="menu-toggle">
                <ion-icon name="menu-outline"></ion-icon>
            </button>
            <nav class="menu-links">
                <a href="./carrinho.jsp" class="links">Carrinho</a>
                <a href="/Velvet_v2/PerfilUsuario" class="links">Meus Dados</a>
                <a href="./listadepedidos.html" class="links">Meus Pedidos</a>
                <a href="/Velvet_v2/lancamentos" class="links">LANÇAMENTOS</a>
                <a href="/Velvet_v2/promocoes" class="links">PROMOÇÕES</a>
                <a href="/Velvet_v2/masculino" class="links">MASCULINO</a>
                <a href="/Velvet_v2/feminino" class="links">FEMININO</a>
                <a href="/Velvet_v2/aromas" class="links">AROMAS</a>
                <a href="/Velvet_v2/neutros" class="links">NEUTROS</a>
                <a href="/Velvet_v2/citricos" class="links">CÍTRICOS</a>
                <a href="/Velvet_v2/views/sobrenos.jsp" class="links">SOBRE NÓS</a>
                <a href="/Velvet_v2/views/contato.jsp" class="links">CONTATO</a>
            </nav>
        </div>
    </div>
    <div class="box-links">
        <nav>
            <a href="/Velvet_v2/lancamentos" class="links">LANÇAMENTOS</a>
            <a href="/Velvet_v2/promocoes" class="links">PROMOÇÕES</a>
            <a href="/Velvet_v2/masculino" class="links">MASCULINO</a>
            <a href="/Velvet_v2/feminino" class="links">FEMININO</a>
            <a href="/Velvet_v2/aromas" class="links">AROMAS</a>
            <a href="/Velvet_v2/neutros" class="links">NEUTROS</a>
            <a href="/Velvet_v2/citricos" class="links">CÍTRICOS</a>
            <a href="/Velvet_v2/views/sobrenos.jsp" class="links">SOBRE NÓS</a>
            <a href="/Velvet_v2/views/contato.jsp" class="links">CONTATO</a>
        </nav>
    </div>
</header>

	<div class="grid-container">
		<!-- Laço para iterar sobre os produtos -->
		<c:forEach var="produto" items="${produtos}">
			<div class="card">
				<img src="./assets/${produto.imagem}" alt="${produto.nome}"
					class="imagem-produto">
				<div class="conteudo-card">
					<h2 class="nome-produto">${produto.nome}</h2>
					<p class="descricao-produto">${produto.desc}</p>
					<div class="preco-produto">
						<span class="preco-original">R$ ${produto.valor}</span>
						<!-- Opcional: Adicionar lógica para desconto -->
						<span class="preco-desconto">R$ ${produto.valor - (produto.valor * 0.1)}</span>
						<span class="desconto-porcentagem">-10%</span>
					</div>
					<a href="/Velvet_v2/detalheProduto?id=${produto.id_produto}">
						<button class="botao-comprar">COMPRAR</button>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
	<footer>
		<div class="box-footer">
			<div class="box-title-inp">
				<h3>Fique atento ás novidades!</h3>
				<div class="box-input">
					<input type="text" placeholder="Insira seu email..." />
					<button>OK</button>
				</div>
			</div>
			<div class="box-sobre">
				<div class="cont-1">
					<h2>Sobre a VELVET</h2>
					<a href="">Quem somos</a>
				</div>
				<div class="cont-1">
					<h3>Precisa de ajuda?</h3>
					<a href="">Fale Conosco</a> <a href="">Sobre Nós</a> <a href="">Politica
						de Privacidade</a>
				</div>
			</div>
			<div class="box-pagamentos">
				<h3>Formas de Pagamento</h3>
				<div class="image-pag">
					<img class="img-cart" src="./img/cartao-3.png" alt="pagamento" />
					<img class="img-cart" src="./img/cartao-2.png" alt="pagamento" />
					<img class="img-cart" src="./img/cartao-1.png" alt="pagamento" />
				</div>
			</div>
		</div>
		<div class="box-redes">
			<p>© Todos os direitos reservados.</p>
			<div class="box-icones">
				<ion-icon class="icon-icon" name="logo-instagram"></ion-icon>
				<ion-icon class="icon-icon" name="logo-facebook"></ion-icon>
			</div>
		</div>
	</footer>
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<script src="pagamento.js"></script>
</body>

</html>