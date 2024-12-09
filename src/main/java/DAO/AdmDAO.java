package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DTO.Adm;

public class AdmDAO {
	public boolean adicionarAdm(Adm adm) {
        String sqlVerifica = "SELECT COUNT(*) FROM administrador WHERE email = ?";
        String sqlInsert = "INSERT INTO administrador (nome, email, senha, status) VALUES (?,?,?,?)";

        try (Connection conn = new ConexaoDAO().conectaBD()) {

            try (PreparedStatement pstmVerifica = conn.prepareStatement(sqlVerifica)) {
                pstmVerifica.setString(1, adm.getEmail());
                ResultSet rs = pstmVerifica.executeQuery();

                if (rs.next() && rs.getInt(1) > 0) {
                    System.out.println("O Administrador já existe no banco de dados.");
                    return false;
                }
            }

            try (PreparedStatement pstmInsert = conn.prepareStatement(sqlInsert)) {
                pstmInsert.setString(1, adm.getNome());
                pstmInsert.setString(2, adm.getEmail());
                pstmInsert.setString(3, adm.getSenha());
                pstmInsert.setInt(4, adm.getStatus());
                pstmInsert.executeUpdate();
                System.out.println("ADM cadastrado com sucesso!");
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erro ao verificar ou inserir a ADM.");
            return false;
        }
    }
}
