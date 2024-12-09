<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
    double frete = 13.90;
    request.setAttribute("frete", frete);
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Velvet - Pedido Confirmado</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pedidoconfirmado.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
        <div class="container mt-5">
            <div class="card p-4 shadow-lg">
                <h2 class="text-center text-success-custom mb-4">Pedido Realizado com Sucesso!</h2>
                <div class="d-flex align-items-center mb-4">
                    <div>
                        <p><strong>Número do Pedido:</strong> #${idPedido}</p>
                        <p><strong>Código de Rastreamento:</strong> ${codigoRastreio}</p>
                        <p><strong>Status:</strong> Confirmado</p>
                    </div>
                </div>
                <div>
                    <h4>Detalhes do Pedido:</h4>
                    <ul>
                        <c:forEach var="item" items="${itensPedido}">
                            <li>${item.nomeProduto} - Quantidade: ${item.quantidade} - Valor: R$ ${item.precoUnitario * item.quantidade}</li>
                        </c:forEach>
                    </ul>
					<p class="text-end fw-bold">Total: R$ ${String.format("%.2f", totalPedido + frete)}</p>
                </div>
                <div class="text-center mt-4">
                    <a href="${pageContext.request.contextPath}/views/index.jsp" class="btn btn-custom">Voltar para a Loja</a>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <!-- Aqui você pode incluir o rodapé do seu site -->
    </footer>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
