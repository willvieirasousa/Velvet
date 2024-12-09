package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.ItemCarrinho;
import DTO.ItemPedidoProduto;
import DTO.Pedido;
import DTO.Produto;

public class PedidoDAO {
	private Connection conn;

	public PedidoDAO(Connection conn) {
		this.conn = conn;
	}

	public ArrayList<ItemCarrinho> finalizarCompra(String email) throws Exception {
		String sqlCarrinho = "SELECT id_carrinho, id_produto, email_cliente, quantidade, total FROM carrinho where email_cliente = ?";
		ArrayList<ItemCarrinho> carrinhos = new ArrayList<>();

		try (PreparedStatement stmt = conn.prepareStatement(sqlCarrinho)) {
			stmt.setString(1, email);
			// Executar a consulta
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					ItemCarrinho carrinho = new ItemCarrinho();
					carrinho.setIdCarrinho(rs.getInt("id_carrinho"));
					carrinho.setIdProduto(rs.getInt("id_produto"));
					carrinho.setEmailCliente(rs.getString("email_cliente"));
					carrinho.setQuantidade(rs.getInt("quantidade"));
					carrinho.setTotal(rs.getDouble("total"));

					carrinhos.add(carrinho);
				}
			}

		}
		return carrinhos;
	}

	public int inserirPedido(List<ItemCarrinho> carrinho, String emailCliente) throws SQLException {
		// Inserir o pedido
		int idPedido = 0;
		String sqlPedido = "INSERT INTO pedido (id_cliente, data_criacao, status, total, cod_pedido, criacao) VALUES (?, CURDATE(), ?, ?, ?, CURDATE())";
		
		try (PreparedStatement stmtPedido = conn.prepareStatement(sqlPedido, PreparedStatement.RETURN_GENERATED_KEYS)) {
			int idCliente = getIdClienteByEmail(emailCliente); 

			double totalPedido = calcularTotalCarrinho(carrinho);

			String codPedido = gerarCodigoPedido();

			stmtPedido.setInt(1, idCliente);
			stmtPedido.setString(2, "Pendente"); 
			stmtPedido.setDouble(3, totalPedido);
			stmtPedido.setString(4, codPedido);

			int rowsAffected = stmtPedido.executeUpdate();

			if (rowsAffected > 0) {
				try (ResultSet generatedKeys = stmtPedido.getGeneratedKeys()) {
					if (generatedKeys.next()) {
					 idPedido = generatedKeys.getInt(1); 
						inserirItensCarrinho(idPedido, carrinho);
					}
				}
			} else {
				throw new SQLException("Falha ao inserir o pedido.");
			}
		}
		return idPedido;

	}

	private double calcularTotalCarrinho(List<ItemCarrinho> carrinho) {
		double total = 0;
		for (ItemCarrinho item : carrinho) {
			total += item.getTotal();
		}
		return total;
	}

	private String gerarCodigoPedido() {
		return "P" + System.currentTimeMillis();
	}

	private int getIdClienteByEmail(String emailCliente) throws SQLException {
		String sql = "SELECT id_cliente FROM clientes WHERE email = ?";
		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, emailCliente);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt("id_cliente");
				} else {
					throw new SQLException("Cliente não encontrado.");
				}
			}
		}
	}

	private void inserirItensCarrinho(int idPedido, List<ItemCarrinho> carrinho) throws SQLException {
		String sqlItem = "INSERT INTO pedido_produto (id_pedido, id_produtos, quantidade, preco_unitario) VALUES (?, ?, ?, ?)";

		try (PreparedStatement stmtItem = conn.prepareStatement(sqlItem)) {
			// Percorrer a lista de itens no carrinho
			for (ItemCarrinho item : carrinho) {
				// Preencher os parâmetros da consulta para cada item
				stmtItem.setInt(1, idPedido); // id do pedido
				stmtItem.setInt(2, item.getIdProduto()); // id do produto
				stmtItem.setInt(3, item.getQuantidade()); // quantidade do produto
				stmtItem.setDouble(4, item.getTotal()); // preço unitário do produto

				stmtItem.addBatch();
			}

			stmtItem.executeBatch();
		}
	}

	public void limparCarrinho(String emailCliente) throws SQLException {
		String sql = "DELETE FROM carrinho WHERE email_cliente = ?";
		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, emailCliente);
			stmt.executeUpdate();
		}
	}
	
	public List<ItemPedidoProduto> getItensPedido(int idPedido) throws SQLException {
		System.out.println("AQUI O ID" + idPedido);
        String sql = "SELECT pp.id_pedido_produto, pp.id_produtos, pp.quantidade, pp.preco_unitario, p.nome " +
                     "FROM pedido_produto pp " +
                     "INNER JOIN produtos p ON pp.id_produtos = p.id_produto " +
                     "WHERE pp.id_pedido = ?";
        List<ItemPedidoProduto> itensPedido = new ArrayList<>();

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPedido);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ItemPedidoProduto item = new ItemPedidoProduto();
                    item.setIdPedidoProduto(rs.getInt("id_pedido_produto"));
                    item.setIdProduto(rs.getInt("id_produtos"));
                    item.setNomeProduto(rs.getString("nome"));
                    item.setQuantidade(rs.getInt("quantidade"));
                    item.setPrecoUnitario(rs.getDouble("preco_unitario"));
                    itensPedido.add(item);
                }
            }
        }
        return itensPedido;
    }

    public String getCodigoRastreio(int idPedido) throws SQLException {
        String sql = "SELECT cod_pedido FROM pedido WHERE id_pedido = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPedido);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("cod_pedido");
                }
            }
        }
        return null;
    }
    
    public List<Pedido> buscarPedidosPorCliente(int idCliente) throws SQLException {
        List<Pedido> listaPedidos = new ArrayList<>();
        String sql = "SELECT * FROM pedido WHERE id_cliente = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idCliente);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setId_pedido(rs.getInt("id_pedido"));
                pedido.setCod_pedido(rs.getString("cod_pedido"));
                pedido.setStatus(rs.getString("status"));
                // Adicione outros campos conforme necessário
                listaPedidos.add(pedido);
            }
        }
        return listaPedidos;
    }
}
