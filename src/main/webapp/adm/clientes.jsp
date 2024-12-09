<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Clientes</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      background-color: #f9f9f9;
    }

.sidebar {
    background-color: #00dac0;
    width: 250px;
    padding: 20px;
    display: flex;
    flex-direction: column;
    color: white;
    position: fixed;
    height: 100%;
    transition: transform 0.3s ease;
    transform: translateX(0);
}

.sidebar.active {
    transform: translateX(-100%);
}

.sidebar .logo img {
    width: 150px;
    margin-bottom: 30px;
}

.sidebar ul {
    list-style: none;
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.sidebar ul li a {
    color: white;
    text-decoration: none;
    font-size: 18px;
    padding: 10px 15px;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.sidebar ul li a:hover {
    background-color: #1bb9a8;
}

    .main-content {
      margin-left: 300px;
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
      background-color: #00dac0;
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

    /* Modal styles */
    .modal {
      display: none;
      position: fixed;
      z-index: 1000;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      justify-content: center;
      align-items: center;
    }

    .modal-content {
      background-color: white;
      padding: 20px;
      border-radius: 10px;
      text-align: center;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    }

    .modal button {
      margin: 10px;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .btn-confirm {
      background-color: #00dac0;
      color: white;
    }

    .btn-cancel {
      background-color: #ff4d4d;
      color: white;
    }
  </style>
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

  <div class="main-content">
    <h2>Clientes</h2>
    <div class="card">
    </div>
    <table>
      <thead>
        <tr>
          <th>#</th>
          <th>Nome</th>
          <th>CPF</th>
          <th>Email</th>
          <th>Ação</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="cliente" items="${clientes}">
          <tr>
            <td>${cliente.id_cliente}</td>
            <td>${cliente.nome}</td>
            <td>${cliente.cpf}</td>
            <td>${cliente.email}</td>
            <td>
              <button class="btn-block" onclick="confirmarExclusao(${cliente.id_cliente}, '${cliente.nome}')">Deletar</button>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <!-- Modal -->
  <div id="modal" class="modal">
    <div class="modal-content">
      <p id="modal-text">Tem certeza que deseja deletar este cliente?</p>
      <button class="btn-confirm" onclick="excluirCliente()">Sim</button>
      <button class="btn-cancel" onclick="fecharModal()">Não</button>
    </div>
  </div>

  <script>
    let clienteIdParaExcluir = 0;

    function confirmarExclusao(id, nome) {
    	  clienteIdParaExcluir = id;
    	  document.getElementById('modal-text').textContent = 'Tem certeza que deseja deletaerr o cliente: ' + nome;
    	  document.getElementById('modal').style.display = 'flex';
    	}

    function fecharModal() {
      clienteIdParaExcluir = null;
      document.getElementById('modal').style.display = 'none';
    }

    function excluirCliente() {
      if (clienteIdParaExcluir) {
        window.location.href = '/Velvet_v2/DeletarClienteServlet?id=' + clienteIdParaExcluir;
      }
    }
  </script>
</body>
</html>