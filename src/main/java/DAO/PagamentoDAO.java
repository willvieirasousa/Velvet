package DAO;

import DTO.Pagamento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PagamentoDAO {

    private Connection connection;

    public PagamentoDAO(Connection connection) {
        this.connection = connection;
    }

    public void inserirPagamento(Pagamento pagamento) throws SQLException {
        String sql = "INSERT INTO pagamento (id_pedido, valor, numero_card, data_venc, nome_titular, cvv, metodo) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, pagamento.getId_pedido());
            stmt.setInt(2, pagamento.getValor());
            stmt.setString(3, pagamento.getNumero_card());
            stmt.setString(4, pagamento.getData_venc());
            stmt.setString(5, pagamento.getNome_titular());
            stmt.setString(6, pagamento.getCvv());
            stmt.setString(7, pagamento.getMetodo());

            stmt.executeUpdate();
        }
    }
}
