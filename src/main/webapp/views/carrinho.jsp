<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
    <%
     session = request.getSession(false); // Não cria nova sessão, apenas retorna a existente
    if (session == null || session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Carrinho</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/carrinho.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
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
      <div class="container-geral-carrinho">
        <div class="content-lista-carrinho">
          <% 
            session = request.getSession(); 
            String emailCliente = (String) session.getAttribute("email");
            
            double totalCarrinho = 0;  // Variável para acumular o total dos itens

            if (emailCliente != null) {
                System.out.println("Email do cliente obtido da sessão: " + emailCliente);
            } else {
                System.out.println("Nenhum email encontrado na sessão.");
            }

            String jdbcURL = "jdbc:mysql://localhost:3306/velvet";
            String dbUser = "root";
            String dbPassword = "";
            double frete = 13.90;

            try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
                String sql = "SELECT c.id_produto, c.quantidade, c.total, p.nome, p.imagem, p.descricao " +
                             "FROM carrinho c " +
                             "JOIN produtos p ON c.id_produto = p.id_produto " +
                             "WHERE c.email_cliente = ?";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, emailCliente);
                ResultSet rs = statement.executeQuery();

                while (rs.next()) {
                    int id_produto = rs.getInt("id_produto");
                    String nomeProduto = rs.getString("nome");
                    String descricao = rs.getString("descricao");
                    String imagem = rs.getString("imagem"); // Certifique-se de armazenar o caminho da imagem no BD
                    int quantidade = rs.getInt("quantidade");
                    double total = rs.getDouble("total");
                    
                    // Acumulando o valor total dos itens
                    totalCarrinho += total;
          %>
          <div class="box-itens-carrinho">
            <div class="box-image">
              <img src="../assets/<%=imagem%>" alt="<%= nomeProduto %>" />
            </div>
            <div class="box-descricao">
              <p><strong><%= nomeProduto %></strong></p>
              <p><%= descricao %></p>
              <p><%= quantidade %> x R$ <%= total / quantidade %></p>
              <div class="box-total">
                <p><strong>Total: R$</strong> <%= total %></p>
              </div>
              <!-- Botão de excluir -->
	        <form action="/Velvet_v2/excluirItemCarrinho" method="post" style="display: inline;">
	            <input type="hidden" name="idProduto" value="<%= id_produto %>" />
	            <input type="hidden" name="emailCliente" value="<%= emailCliente %>" />
	            <button type="submit" class="btn btn-danger btn-sm">Excluir</button>
	        </form>
            </div>
          </div>
          <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
          %>
          <p>Erro ao carregar itens do carrinho.</p>
          <% } %>
        </div>
        <div class="content-list-valor">
		    <p><strong>Resumo</strong>:</p>
		    <div class="box-todos-produtos">
		        <div class="box-produtos">
		            <p>Total de itens no carrinho</p>
		            <p>R$ <%= totalCarrinho %></p> <!-- Exibe o total acumulado -->
		        </div>
		        <% if (totalCarrinho > 0) { %> <!-- Condição para exibir o frete -->
		        <div class="box-produtos">
		            <p>Frete</p>
		            <p>R$ <%= frete %></p>
		        </div>
		        <% } %>
		    </div>
		    <div class="box-produtos">
		        <p><strong>TOTAL</strong></p>
		        <p>R$ <%= totalCarrinho + (totalCarrinho > 0 ? frete : 0) %></p> <!-- Soma o frete apenas se o carrinho não estiver vazio -->
		    </div>
<a href="<%= totalCarrinho > 0 ? "pagamento.jsp" : "#" %>">
    <button <% if (totalCarrinho <= 0) { %>disabled<% } %>>IR PARA PAGAMENTO</button>
</a>


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
            <a href="">Fale Conosco</a>
            <a href="">Sobre Nós</a>
            <a href="">Politica de Privacidade</a>
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

    <script
      type="module"
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <script src="../js/carrinho.js"></script>
  </body>
</html>
