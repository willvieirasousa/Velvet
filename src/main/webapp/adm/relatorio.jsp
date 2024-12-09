<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatório de Produtos</title>
    <link rel="stylesheet" href="./css/admHome.css"/>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f0f0f0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .container {
            display: flex;
            flex: 1;
        }

        .sidebar {
            background-color: #00dac0;
            width: 250px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            color: white;
            min-height: 100vh;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
            width: 100%;
        }

        .sidebar ul li {
            margin: 15px 0;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            display: block;
            width: 100%;
            border-radius: 8px;
            padding: 10px;
        }

        .sidebar ul li a:hover {
            background-color: #1bb9a8;
        }

        .main-content {
            flex-grow: 1;
            padding: 20px;
        }

        .header {
            background-color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .header h1 {
            font-size: 28px;
            color: #333;
        }

        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        .card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card h2 {
            font-size: 24px;
            color: #2de0ca;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 18px;
            color: #333;
        }

        .card-icon {
            font-size: 40px;
            color: #2de0ca;
            margin-bottom: 10px;
        }

        form {
            margin: 20px 0;
            display: flex;
            gap: 10px;
            align-items: center;
        }

        label {
            font-size: 18px;
            color: #333;
        }

        input[type="date"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            width: 200px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #2de0ca;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #1bb9a8;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                padding: 10px;
            }

            .card-container {
                grid-template-columns: 1fr;
            }

            .header h1 {
                font-size: 24px;
            }

            input[type="date"] {
                width: 150px;
            }
        }
    </style>
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
                <h1>Relatório - Velvet</h1>
            </div>

            <form method="POST" action="/Velvet_v2/FiltraRelatorio">
                <label for="start">A partir de:</label>
                <input type="date" id="start" name="data" min="2024-10-01" required/>
                <button type="submit">Filtrar</button>
            </form>

            <div class="card-container">
                <div class="card">
                    <div class="card-icon"></div>
                    <h2>Total de Produtos</h2>
                    <p>${quantidadeProdutos}</p>
                </div>
                <div class="card">
                    <div class="card-icon"></div>
                    <h2>Total de Pedidos</h2>
                    <p>${quantidadePedidos}</p>
                </div>
                <div class="card">
                    <div class="card-icon"></div>
                    <h2>Produtos em estoque</h2>
                    <p>${estoque}</p>
                </div>
                <div class="card">
                    <div class="card-icon"></div>
                    <h2>Total Vendido</h2>
                    <p>R$ ${totalVendas}</p>
                </div>
                <div class="card">
                    <div class="card-icon"></div>
                    <h2>Clientes Cadastrados</h2>
                    <p>${clientesCadastrados}</p>
                </div>
                <div class="card">
                    <div class="card-icon"></div>
                    <h2>Pedidos entregues</h2>
                    <p>${pedidosEntregues}</p>
                </div>
                <div class="card">
                    <div class="card-icon"></div>
                    <h2>Itens Vendidos</h2>
                    <p>${quantidadeItensPedidos}</p>
                </div>
            </div>

            <button onClick="gerarPDF()">Gerar PDF</button>
        </div>
    </div>

    <script>
        function gerarPDF() {
            // Requisição para o servidor que vai gerar o PDF
        	window.location.href = "/Velvet_v2/gerarPDF";
        }
    </script>
</body>
</html>
