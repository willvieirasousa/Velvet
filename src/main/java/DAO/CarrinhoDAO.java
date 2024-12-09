package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DTO.ItemCarrinho;

public class CarrinhoDAO {
    private Connection connection;

    public CarrinhoDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean adicionarProduto(ItemCarrinho carrinho) throws Exception {
        String sql = "INSERT INTO carrinho (id_produto, email_cliente, quantidade, total) VALUES (?, ?, ?, ?) " +
                     "ON DUPLICATE KEY UPDATE quantidade = quantidade + ?, total = total + ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, carrinho.getIdCarrinho());
            stmt.setString(2, carrinho.getEmailCliente());
            stmt.setInt(3, carrinho.getQuantidade());
            stmt.setDouble(4, carrinho.getTotal());
            stmt.executeUpdate();
            return true;
        }
    }

    // Alterar a quantidade de um produto no carrinho
    public void alterarQuantidade(int idCarrinho, int novaQuantidade, double preco) throws Exception {
        String sql = "UPDATE carrinho SET quantidade = ?, total = ? WHERE id_carrinho = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, novaQuantidade);
            stmt.setDouble(2, novaQuantidade * preco);
            stmt.setInt(3, idCarrinho);
            stmt.executeUpdate();
        }
    }

    // Remover um produto do carrinho
    public void removerProduto(int idCarrinho) throws Exception {
        String sql = "DELETE FROM carrinho WHERE id_carrinho = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idCarrinho);
            stmt.executeUpdate();
        }
    }

    // Listar itens do carrinho de um cliente
    public List<ItemCarrinho> listarItens(String emailCliente) throws Exception {
        List<ItemCarrinho> itens = new ArrayList<>();
        String sql = "SELECT * FROM carrinho WHERE email_cliente = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, emailCliente);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ItemCarrinho item = new ItemCarrinho(
                    rs.getInt("id_carrinho"),
                    rs.getInt("id_produto"),
                    rs.getString("email_cliente"),
                    rs.getInt("quantidade"),
                    rs.getDouble("total")
                );
                itens.add(item);
            }
        }
        return itens;
    }
}
