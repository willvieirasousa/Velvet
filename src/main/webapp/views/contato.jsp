<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Velvet</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contato.css">
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
    <h2>FALE CONOSCO</h2>
    <div class="contato-cartaos">
        <div class="img-contato">
            <img src="../assets/pngwing.com (2).png" alt="WhatsApp">
            <h3>WhatsApp</h3>
            <p>(11) 9 9999-9999</p>
            <p>Horário de atendimento:</p>
            <p>Segunda à Sexta: 09:00 às 18:00</p>
            <p>Sábado: 10:00 às 17:00</p>
        </div>
        <div class="img-contato">
            <img src="../assets/pngwing.com (3).png" alt="Email">
            <h3>EMAIL</h3>
            <p>contato@velvet.com</p>
            <p>Horário de atendimento:</p>
            <p>Segunda à Sexta: 09:00 às 18:00</p>
            <p>Sábado: 10:00 às 17:00</p>
        </div>
        <div class="img-contato">
            <img src="../assets/pngwing.com (4).png" alt="Telefone">
            <h3>TELEFONE</h3>
            <p>(11) 9 9999-9999</p>
            <p>Horário de atendimento:</p>
            <p>Segunda à Sexta: 09:00 às 18:00</p>
            <p>Sábado: 10:00 às 17:00</p>
        </div>
        <div class="img-contato">
            <img src="../assets/pngwing.com (5).png" alt="Assistente Virtual">
            <h3>Assistente Virtual</h3>
            <p>(11) 9 9999-9999</p>
            <p>Horário de atendimento: 24 horas</p>
        </div>
    </div>
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

</body>
</html>
