package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import DTO.Marca;

public class MarcaDAO {
    public boolean adicionarMarca(Marca marca) {
        String sqlVerifica = "SELECT COUNT(*) FROM marca WHERE nome = ?";
        String sqlInsert = "INSERT INTO marca (nome) VALUES (?)";

        try (Connection conn = new ConexaoDAO().conectaBD()) {

            try (PreparedStatement pstmVerifica = conn.prepareStatement(sqlVerifica)) {
                pstmVerifica.setString(1, marca.getNome());
                ResultSet rs = pstmVerifica.executeQuery();

                if (rs.next() && rs.getInt(1) > 0) {
                    System.out.println("A marca já existe no banco de dados.");
                    return false;
                }
            }

            try (PreparedStatement pstmInsert = conn.prepareStatement(sqlInsert)) {
                pstmInsert.setString(1, marca.getNome());
                pstmInsert.executeUpdate();
                System.out.println("Marca cadastrada com sucesso!");
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erro ao verificar ou inserir a marca.");
            return false;
        }
    }
}
