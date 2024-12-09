package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DTO.Cupom;

public class CupomDAO {
	public boolean adicionarCupom(Cupom cupom) {
        String sqlVerifica = "SELECT COUNT(*) FROM cupomdesconto WHERE cod_cupom = ?";
        String sqlInsert = "INSERT INTO cupomdesconto (cod_cupom, valor) VALUES (?, ?)";

        try (Connection conn = new ConexaoDAO().conectaBD()) {

            try (PreparedStatement pstmVerifica = conn.prepareStatement(sqlVerifica)) {
                pstmVerifica.setString(1, cupom.getCod_cupom());
                ResultSet rs = pstmVerifica.executeQuery();

                if (rs.next() && rs.getInt(1) > 0) {
                    System.out.println("A O cupom já existe.");
                    return false;
                }
            }

            try (PreparedStatement pstmInsert = conn.prepareStatement(sqlInsert)) {
                pstmInsert.setString(1, cupom.getCod_cupom());
                pstmInsert.setDouble(2, cupom.getValor());
                pstmInsert.executeUpdate();
                System.out.println("Cupom cadastrado com sucesso!");
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erro ao verificar ou inserir o cupom.");
            return false;
        }
    }
}
