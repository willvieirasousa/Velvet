<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
    double frete = 13.90;
    request.setAttribute("frete", frete);
%>
<%
HttpSession sessao = request.getSession();

//Verifico se é nulo ou vazio
if (sessao == null || sessao.getAttribute("email") == null || sessao.getAttribute("email").equals("")) {
	//Se for vazio, redireciono para a tela de login	
    response.sendRedirect("${pageContext.request.contextPath}/views/login.jsp"); 
}
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Lista de Pedidos</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/listadepedidos.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
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
	<main>
		<div class="container-geral-home">
			<div class="content-box-geral-lista">
				<div class="box-vazio-meio">
					<div class="titulo-icones">
						<ion-icon name="person-outline"></ion-icon>
						<a href="/Velvet_v2/PerfilUsuario">Meus Dados</a>
					</div>
					<div class="titulo-icones">
						<ion-icon name="bag-handle-outline"></ion-icon>
						<a href="./listadepedidos.jsp">Meus Pedidos</a>
					</div>
					<div class="titulo-icones">
              <ion-icon name="person-outline"></ion-icon>
              <a href="${pageContext.request.contextPath}/views/logout.jsp">Sair</a>
            </div>
				</div>
				<div class="box-conteudo-meio">
					<h2 class="titulo-1">Meus Pedidos</h2>

					<c:forEach var="pedido" items="${listaPedidos}">
						<div class="box-ped-cod">
							<div class="content-itens">
								<div class="box-1">
									<div class="box-pedidos">
										<ion-icon class="icones-pedidos" name="bag-handle-outline"></ion-icon>
										<p>PEDIDO: #${pedido.id_pedido}</p>
									</div>
									<div class="box-pedidos">
										<ion-icon class="icones-pedidos" name="rocket-outline"></ion-icon>
										<p>CÓDIGO DE RASTREIO: ${pedido.cod_pedido}</p>
									</div>
								</div>
								<p>STATUS: ${pedido.status}</p>
							</div>

							<!-- Botão de toggle (seta) para exibir os detalhes -->
							<button class="toggle-details"
								onclick="toggleDetails(${pedido.id_pedido})">
								<ion-icon name="chevron-down-outline"
									id="arrow-${pedido.id_pedido}"></ion-icon>
							</button>

							<div class="box-detalhes" id="details-${pedido.id_pedido}"
								style="display: none;">
								<div class="content-geral-detalhes">
									<div class="produtos">
										<div class="titulo-produtos">
											<p>PRODUTOS</p>
										</div>
										<c:forEach var="item" items="${pedido.itens}">
											<p>${item.nomeProduto}</p>
										</c:forEach>
									</div>
									<div class="produtos">
										<div class="titulo-produtos">
											<p>QUANTIDADE</p>
										</div>
										<c:forEach var="item" items="${pedido.itens}">
											<p>${item.quantidade}</p>
										</c:forEach>
									</div>
									<div class="produtos">
										<div class="titulo-produtos">
											<p>VALOR</p>
										</div>
										<c:forEach var="item" items="${pedido.itens}">
											<p>${item.precoUnitario}</p>
										</c:forEach>
									</div>
								</div>
								<div class="valor-total">
									<p>TOTAL: ${String.format("%.2f", pedido.total + frete)}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</main>
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
					<img class="img-cart" src="../assets/cartao-3.png" alt="pagamento" />
					<img class="img-cart" src="../assets/cartao-2.png" alt="pagamento" />
					<img class="img-cart" src="../assets/cartao-1.png" alt="pagamento" />
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
	<script>
  function toggleDetails(pedidoId) {
    var detailsDiv = document.getElementById('details-' + pedidoId);
    var arrowIcon = document.getElementById('arrow-' + pedidoId);

    if (detailsDiv.style.display === "none") {
      detailsDiv.style.display = "block";
      arrowIcon.setAttribute("name", "chevron-up-outline");  // Muda a seta para cima
    } else {
      detailsDiv.style.display = "none";
      arrowIcon.setAttribute("name", "chevron-down-outline");  // Muda a seta para baixo
    }
  }
</script>
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="../js/listadepedidos.js"></script>
</body>
</html>
</html>