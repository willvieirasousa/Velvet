package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import DTO.Clientes;

public class ClienteDAO {
	
	private Connection conn;

	public ClienteDAO(Connection conn) {
		this.conn = conn;
	}
	
	
	public ArrayList<Clientes> listarClientes() throws SQLException {
		ArrayList<Clientes> clientes = new ArrayList<>();
		String sql = "SELECT * FROM clientes";

		try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
			while (rs.next()) {
				Clientes cliente = new Clientes();
				
				cliente.setId_cliente(rs.getInt("id_cliente"));
				cliente.setNome(rs.getString("nome"));
				cliente.setCpf(rs.getString("cpf"));
				cliente.setEmail(rs.getString("email"));
				cliente.setTelefone(rs.getString("telefone"));
				cliente.setDataNascimento(rs.getString("dataNascimento"));
				cliente.setCriacao(rs.getString("criacao"));
				
				
				clientes.add(cliente);
			}
		}
		return clientes;
	}
	
	public boolean deletarClientes(int id) throws SQLException {
	    String sql = "DELETE FROM clientes WHERE id_cliente = ?";

	    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setInt(1, id);

	        // Use executeUpdate() para comandos como DELETE, INSERT ou UPDATE
	        int rowsAffected = stmt.executeUpdate();

	        // Verifica se alguma linha foi afetada
	        return rowsAffected > 0;
	    } catch (SQLException e) {
	        System.out.println(e);
	        return false;
	    }
	}
}
