<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pedidos</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      background-color: #f9f9f9;
    }

    .sidebar {
      width: 250px;
      background-color: #00c3a3;
      color: white;
      height: 100vh;
      position: fixed;
      top: 0;
      left: 0;
      padding: 20px 10px;
    }

    .sidebar h1 {
      text-align: center;
      font-size: 24px;
      margin-bottom: 20px;
    }

    .sidebar ul {
      list-style: none;
      padding: 0;
    }

    .sidebar ul li {
      margin: 15px 0;
    }

    .sidebar ul li a {
      text-decoration: none;
      color: white;
      font-size: 18px;
    }

    .main-content {
      margin-left: 260px;
      padding: 20px;
    }

    .main-content h2 {
      margin-bottom: 20px;
    }

    .card {
      background-color: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      display: inline-block;
      margin-bottom: 20px;
    }

    .card h3 {
      margin: 0;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    table thead {
      background-color: #00c3a3;
      color: white;
    }

    table th, table td {
      padding: 15px;
      text-align: left;
      border: 1px solid #ddd;
    }

    table tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    .btn-block {
      background-color: #ff4d4d;
      color: white;
      border: none;
      padding: 8px 12px;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .btn-block:hover {
      background-color: #e60000;
    }
  </style>
</head>
<body>
  <div class="sidebar">
    <h1>Velvet</h1>
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
    <h2>Pedidos</h2>
    <table>
      <thead>
        <tr>
          <th>ID Pedido</th>
          <th>ID Cliente</th>
          <th>Status</th>
          <th>Total</th>
          <th>Código</th>
          <th>Data Criação</th>
          <th>Qtd Itens</th>
        </tr>
      </thead>
      <tbody>
            <c:forEach var="pedido" items="${pedidos}">
                <tr>
                    <td>${pedido.id_pedido}</td>
                    <td>${pedido.id_cliente}</td>
                    <td>${pedido.status}</td>
                    <td>R$${pedido.total}</td>
                    <td>${pedido.cod_pedido}</td>
                    <td>${pedido.criacao}</td>
                    <td>${pedido.qtd_itens_pedido}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
  </div>

</body>
</html>
