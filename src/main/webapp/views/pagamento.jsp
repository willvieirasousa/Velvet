<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    HttpSession sessao = request.getSession();

    // Verifico se é nulo ou vazio
    if (sessao == null || sessao.getAttribute("email") == null || sessao.getAttribute("email").equals("")) { 
        // Se for vazio, redireciono para a tela de login  
        response.sendRedirect("login.jsp"); 
    }
%>    

<!DOCTYPE html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Formulários de Endereço e Pagamento</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagamento.css">
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

    <div class="container">
      <!-- Card de Endereço -->
      <div class="card">
        <h2>Seus Dados</h2>
        <form action="/Velvet_v2/FinalizarCompra" method="POST">
          <!-- Dados de Endereço -->
          <div class="form-group">
            <label for="cep">CEP</label>
            <input type="text" id="cep" name="cep" placeholder="00000-000" required>
          </div>
          <div class="form-group">
            <label for="logradouro">Endereço</label>
            <input type="text" id="logradouro" name="logradouro" placeholder="Rua, Avenida, etc." required>
          </div>
          <div class="form-group">
            <label for="numero">Número</label>
            <input type="text" id="numero" name="numero" placeholder="Número da residência" required>
          </div>
          <div class="form-group">
            <label for="bairro">Bairro</label>
            <input type="text" id="bairro" name="bairro" placeholder="Bairro" required>
          </div>
          <div class="form-group">
            <label for="complemento">Complemento</label>
            <input type="text" id="complemento" name="complemento" placeholder="Complemento" />
          </div>
          <div class="form-group">
            <label for="cidade">Cidade</label>
            <input type="text" id="cidade" name="cidade" placeholder="cidade" />
          </div>

          <h2>Dados de Pagamento</h2>
          <!-- Botões de seleção exclusiva -->
          <div class="payment-method-selection">
            <button type="button" class="payment-btn" id="credito" onclick="togglePaymentSelection(this)">Cartão de Crédito</button>
            <button type="button" class="payment-btn" id="debito" onclick="togglePaymentSelection(this)">Cartão de Débito</button>
          </div>

          <div class="form-group">
            <label for="nome-no-cartao">Nome no Cartão</label>
            <input type="text" id="nome-no-cartao" name="nome_titular" placeholder="Nome do titular" required>
          </div>
          <div class="form-group">
            <label for="numero-cartao">Número do Cartão</label>
            <input type="text" id="numero-cartao" name="numero_card" placeholder="0000 0000 0000 0000" required>
          </div>
          <div class="form-row">
            <div class="form-group">
              <label for="validade-mes">Validade (MM/AAAA)</label>
              <div class="validade-inputs">
                <input type="text" id="validade-mes" name="data_venc" placeholder="MM/AAAAA" maxlength="6" required>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="cvv">CVV</label>
            <input type="text" id="cvv" name="cvv" maxlength="3" required>
          </div>

          <div class="form-group">
            <button type="submit" class="btn">Comprar</button>
          </div>
        </form>
      </div>
    </div>

    <footer>
      <div class="box-footer">
        <div class="box-title-inp">
          <h3>Fique atento às novidades!</h3>
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
            <a href="">Fale Conosco</a>
            <a href="">Sobre Nós</a>
            <a href="">Politica de Privacidade</a>
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
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/pagamento.js"></script>
</body>

</html>
