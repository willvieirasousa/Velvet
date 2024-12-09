<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
    HttpSession sessao = request.getSession();

	//Verifico se é nulo ou vazio
    if (sessao == null || sessao.getAttribute("emailAdm") == null || sessao.getAttribute("emailAdm").equals("")) { 
    	  //Se for vazio, redireciono para a tela de login	
          response.sendRedirect("LoginAdm.jsp"); 
    }

%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel Velvet</title>
<link rel="stylesheet" href="./css/admHome.css"/>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <div class="logo">
                <img src="./assets/logo_velvet_CF.png"/>
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
        <div class="main-content">
            <div class="header">
                <div class="user-info">
                    <div class="avatar"></div>
                    <div>
                        <h3>Bem Vindo! Fulano!</h3>
                        <p>fulano@velvet.com</p>
                    </div>
                </div>
            </div>
            <div class="cards">
                <div class="card">
                    <div class="card-icon">&#128722;</div>
                    <p>Usuários cadastrados</p>
                    <h2>${clientesCadastrados}</h2>
                </div>
                <div class="card">
                    <div class="card-icon">&#128722;</div>
                    <p>Produtos vendidos</p>
                    <h2>${quantidadeProdutos}</h2>
                </div>
                <div class="card">
                    <div class="card-icon">&#128722;</div>
                    <p>Pedidos realizados</p>
                    <h2>${quantidadePedidos}</h2>
                </div>
                <div class="card">
                    <div class="card-icon">&#128722;</div>
                    <p>Valor em vendas</p>
                    <h2>R$ ${totalVendas}</h2>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
