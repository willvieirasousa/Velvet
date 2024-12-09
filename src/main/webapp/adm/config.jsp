<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Configurações</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/config.css">
</head>
<body>
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

    <div class="container">
        <div class="header">
            <div class="user-info">
                <div class="avatar"></div>
                <div>
                    <h1>Configurações</h1>
                    <p>Cadastrar marca, administrador e cupom de desconto</p>
                </div>
            </div>
        </div>

        <div class="forms">
            <div class="form-section">
                <h2>Cadastrar Marca</h2>
                <form action="/Velvet_v2/cadastrarMarca" method="POST">
                    <label for="marcaNome">Nome da Marca:</label>
                    <input type="text" id="marcaNome" name="nomeMarca" required>
                    <button type="submit">Cadastrar Marca</button>
                </form>
            </div>

            <div class="form-section">
                <h2>Cadastrar Administrador</h2>
                <form action="/Velvet_v2/cadastrarAdmin" method="POST">
                    <label for="adminNome">Nome:</label>
                    <input type="text" id="adminNome" name="adminNome" required>

                    <label for="adminEmail">E-mail:</label>
                    <input type="email" id="adminEmail" name="adminEmail" required>

                    <label for="adminSenha">Senha:</label>
                    <input type="password" id="adminSenha" name="adminSenha" required>
                    
                    <label for="statusAdmin">Status:</label>
                    <select id="statusAdmin" name="status">
						<option value="1">Ativo</option>
						<option value="0">Inativo</option>
					</select>
                    <button type="submit">Cadastrar Administrador</button>
                </form>
            </div>

            <div class="form-section">
                <h2>Cadastrar Cupom de Desconto</h2>
                <form action="/Velvet_v2/cadastrarCupom" method="POST">
                    <label for="cupomCodigo">Código do Cupom:</label>
                    <input type="text" id="cupomCodigo" name="cupomCodigo" required>

                    <label for="cupomDesconto">Valor do Desconto (em reais):</label>
                    <input type="number" id="cupomDesconto" name="valor" required>

                    <button type="submit">Cadastrar Cupom</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
