package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.ItemPedidoProduto;  // Classe DTO que armazena os itens do pedido_produto

public class PedidoProdutoDAO {

    private Connection connection;

    public PedidoProdutoDAO(Connection connection) {
        this.connection = connection;
    }

    // Método que retorna a lista de produtos de um pedido
    public List<ItemPedidoProduto> buscarProdutosDoPedido(int idPedido) throws SQLException {
        List<ItemPedidoProduto> itens = new ArrayList<>();

        // SQL para buscar os produtos e as informações da tabela pedido_produto
        String sql = "SELECT pp.id_pedido_produto, pp.id_produtos, pp.quantidade, pp.preco_unitario, p.nome " + 
                     "FROM pedido_produto pp " + 
                     "INNER JOIN produtos p ON pp.id_produtos = p.id_produto " + 
                     "WHERE pp.id_pedido = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idPedido);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ItemPedidoProduto item = new ItemPedidoProduto();
                    item.setIdPedidoProduto(rs.getInt("id_pedido_produto"));
                    item.setIdProduto(rs.getInt("id_produtos"));
                    item.setQuantidade(rs.getInt("quantidade"));
                    item.setPrecoUnitario(rs.getDouble("preco_unitario"));
                    item.setNomeProduto(rs.getString("nome"));

                    itens.add(item);  // Adiciona o item à lista de itens
                }
            }
        }

        return itens;
    }
}
