<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/detalheProduto.css">
    <title>Produto - Velvet</title>
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
        <div class="produto-detalhes">
            <c:forEach var="produto" items="${produtos}">
                <div class="produto-imagem">
                    <img src="./assets/${produto.imagem}" alt="${produto.nome}" class="imagem-produto">
                </div>
                <div class="produto-info">
                    <h1>${produto.nome} - ${produto.marca}, 100ml</h1>
                    <p>${produto.desc}</p>
                    <div class="produto-preco">
                        <span class="preco-original">R$ ${produto.valor}</span>
                        <!-- Lógica de desconto opcional -->
                        <span class="desconto">-10%</span>
                        <span class="preco-final">R$ ${produto.valor * 0.9}</span>
                        <span class="parcelamento">8x R$ ${(produto.valor * 0.9) / 8}</span>
						<form action="adicionarCarrinho" method="post">
						    <input type="hidden" name="idProduto" value="${produto.id_produto}">
							<input type="hidden" name="emailCliente" value="${sessionScope.email}">
						    <input type="hidden" name="quantidade" value="1">
						    <input type="hidden" name="total" value="${produto.valor}">
						    <button type="submit" class="botao-comprar">COMPRAR</button>
						</form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>

    <footer>
        <div class="box-footer">
            <div class="box-title-inp">
                <h3>Fique atento às novidades!</h3>
                <div class="box-input">
                    <input type="text" placeholder="Insira seu email...">
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
                    <a href="">Fale Conosco</a>
                    <a href="">Sobre Nós</a>
                    <a href="">Política de Privacidade</a>
                </div>
            </div>
            <div class="box-pagamentos">
                <h3>Formas de Pagamento</h3>
                <div class="image-pag">
                    <img class="img-cart" src="./img/cartao-3.png" alt="pagamento">
                    <img class="img-cart" src="./img/cartao-2.png" alt="pagamento">
                    <img class="img-cart" src="./img/cartao-1.png" alt="pagamento">
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

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
