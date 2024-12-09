package DAO;

import DTO.Endereco;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EnderecoDAO {

    private Connection connection;

    public EnderecoDAO(Connection connection) {
        this.connection = connection;
    }

    public void inserirEndereco(Endereco endereco) throws SQLException {
        String sql = "INSERT INTO endereco (cidade, id_clientes, logradouro, bairro, cep, numero, complemento) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, endereco.getCidade());
            stmt.setInt(2, endereco.getId_clientes());
            stmt.setString(3, endereco.getLogradouro());
            stmt.setString(4, endereco.getBairro());
            stmt.setString(5, endereco.getCep());
            stmt.setInt(6, endereco.getNumero());
            stmt.setString(7, endereco.getComplemento());

            stmt.executeUpdate();
        }
    }
    
    public Endereco getEnderecoByCliente(int clienteId) throws SQLException {
        String sql = "SELECT * FROM endereco WHERE id_clientes = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, clienteId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Endereco endereco = new Endereco();
                    endereco.setId_endereco(rs.getInt("id_endereco"));
                    endereco.setId_clientes(rs.getInt("id_clientes"));
                    endereco.setLogradouro(rs.getString("logradouro"));
                    endereco.setNumero(rs.getInt("numero"));
                    endereco.setCep(rs.getString("cep"));
                    return endereco;
                } else {
                    return null;
                }
            }
        }
    }
}
