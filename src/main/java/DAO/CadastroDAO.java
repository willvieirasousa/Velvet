package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.Cadastro;
import DTO.Categoria;
import DTO.Marca;
import DTO.Produto;

public class CadastroDAO {

    public boolean adicionarCadastro(Cadastro cadastro) {
        String sql = "INSERT INTO clientes (nome, cpf, email, telefone, dataNascimento, senha) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = new ConexaoDAO().conectaBD(); 
             PreparedStatement pstm = conn.prepareStatement(sql)) {

            if (conn == null) {
                System.out.println("Erro: Conexão não foi estabelecida.");
                return false;  
            }
            System.out.println("passou");
            try (PreparedStatement pstmVerificaEmail = conn.prepareStatement("SELECT COUNT(*) FROM clientes WHERE email = ?")) {
                pstmVerificaEmail.setString(1, cadastro.getEmail());
                ResultSet rs = pstmVerificaEmail.executeQuery();
                
                if (rs.next() && rs.getInt(1) > 0) {
                    System.out.println("Erro: E-mail já cadastrado.");
                    return false;  
                }
            }

            System.out.println("Conexão estabelecida e preparando a consulta.");

            pstm.setString(1, cadastro.getNome());
            pstm.setString(2, cadastro.getCpf());
            pstm.setString(3, cadastro.getEmail());
            pstm.setString(4, cadastro.getTelefone());
            pstm.setString(5, cadastro.getDataNascimento());
            pstm.setString(6, cadastro.getSenha());

            pstm.executeUpdate();  
            System.out.println("Cadastro inserido com sucesso!");
            return true;  
        } catch (SQLException e) {
            System.out.println("Erro ao inserir cadastro no banco de dados");
            e.printStackTrace();  
            return false;  
        } catch (Exception e) {
            System.out.println("Erro inesperado");
            e.printStackTrace();  
            return false;  
        }
    }
public void adicionarCadastroProduto(Produto produto) {
    	
    	/*ZoneId saZoneId = ZoneId.of("America/Sao_Paulo");
    	
    	ZonedDateTime saDateTime = ZonedDateTime.now(saZoneId);
    	
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
    	
    	String DataFormatada = saDateTime.format(formatter);
    	
    	String criacao = "ADM | " + DataFormatada;*/
    	
    	
        String sql = "INSERT INTO produtos (nome, valor, custo, descricao, tamanho, capacidade, imagem, id_categoria, id_marca, estoque, criacao, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = new ConexaoDAO().conectaBD(); 
             PreparedStatement pstm = conn.prepareStatement(sql)) {

            

            System.out.println("Conexão estabelecida e preparando a consulta.");
            
            pstm.setString(1, produto.getNome());
            pstm.setString(2, produto.getValor());
            pstm.setString(3, produto.getCusto());
            pstm.setString(4, produto.getDesc());
            pstm.setString(5, produto.getTamanho());
            pstm.setString(6, produto.getConteudo());
            pstm.setString(7, produto.getImagem());
            pstm.setInt(8, produto.getCategorias());
            pstm.setInt(9, produto.getMarca());
            pstm.setString(10, produto.getEstoque());
            pstm.setString(11, produto.getCriacao());
            pstm.setString(12, produto.getStatus());


            pstm.executeUpdate();  
            System.out.println("Cadastro inserido com sucesso!");

        } catch (SQLException e) {
        	System.out.print(e);
        	System.out.println("Erro ao daqewqewqdos");
            e.printStackTrace();  
            
        } catch (Exception e) {
            System.out.println("Erro inesperado");
            e.printStackTrace();
        }
    }


public void atualizarCadastroProduto(Produto produto) {
	
	/*ZoneId saZoneId = ZoneId.of("America/Sao_Paulo");
	
	ZonedDateTime saDateTime = ZonedDateTime.now(saZoneId);
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
	
	String DataFormatada = saDateTime.format(formatter);
	
	String criacao = "ADM | " + DataFormatada;*/
	
	
    String sql = "UPDATE INTO produtos (nome, valor, custo, descricao, tamanho, capacidade, imagem, id_categoria, id_marca) VALUES (?, ?, ?, ?, ?, ?, ?, 1, 2)";

    try (Connection conn = new ConexaoDAO().conectaBD(); 
         PreparedStatement pstm = conn.prepareStatement(sql)) {

        

        System.out.println("Conexão estabelecida e preparando a consulta.");
        
        pstm.setString(1, produto.getNome());
        pstm.setString(2, produto.getValor());
        pstm.setString(3, produto.getCusto());
        pstm.setString(4, produto.getDesc());
        pstm.setString(5, produto.getTamanho());
        pstm.setString(6, produto.getConteudo());
        pstm.setString(7, produto.getImagem());

        pstm.executeUpdate();  // Execute o comando=
        System.out.println("Cadastro inserido com sucesso!");

    } catch (SQLException e) {
    	System.out.print(e);
    	System.out.println("Erro ao daqewqewqdos");
        e.printStackTrace();  // Exibe detalhes sobre o erro
        
    } catch (Exception e) {
        System.out.println("Erro inesperado");
        e.printStackTrace();  // Exibe detalhes sobre outros tipos de erro
    }
}

	public Cadastro getClienteByEmail(String email) throws SQLException {
		System.out.println("AQ O EMAIL" + email);
	    String sql = "SELECT id_cliente, nome, email, cpf, dataNascimento  FROM clientes WHERE email = ?";
	    try (Connection conn = new ConexaoDAO().conectaBD(); 
	             PreparedStatement pstm = conn.prepareStatement(sql)) {
	        pstm.setString(1, email);
	        try (ResultSet rs = pstm.executeQuery()) {
	            if (rs.next()) {
	            	Cadastro cliente = new Cadastro();
	                cliente.setId_cliente(rs.getInt("id_cliente"));
	                cliente.setNome(rs.getString("nome"));
	                cliente.setEmail(rs.getString("email"));
	                cliente.setCpf(rs.getString("cpf"));
	                cliente.setDataNascimento(rs.getString("dataNascimento"));
	                return cliente;
	            } else {
	                return null; // Cliente não encontrado
	            }
	        }
	    }
	}
	
	 public int buscarIdClientePorEmail(String email) throws SQLException {
	        String sql = "SELECT id_cliente FROM clientes WHERE email = ?";
	        try (Connection conn = new ConexaoDAO().conectaBD(); 
		             PreparedStatement pstm = conn.prepareStatement(sql)) {
	        	pstm.setString(1, email);
	            ResultSet rs = pstm.executeQuery();
	            if (rs.next()) {
	                return rs.getInt("id_cliente");
	            } else {
	                throw new SQLException("Cliente não encontrado.");
	            }
	        }
	    }
	 
	 
		
		public List<Marca> listarMarcas() throws SQLException {
		    List<Marca> marcas = new ArrayList<>();
		    String sql = "SELECT id_marca, nome FROM marca";
		    try (Connection conn = new ConexaoDAO().conectaBD(); 
		         PreparedStatement ps = conn.prepareStatement(sql);
		         ResultSet rs = ps.executeQuery()) {
		        while (rs.next()) {
		            Marca marca = new Marca();
		            marca.setId_marca(rs.getInt("id_marca"));
		            marca.setNome(rs.getString("nome"));
		            marcas.add(marca);
		        }
		    }
		    return marcas;
		}

		public List<Categoria> listarCategorias() throws SQLException {
		    List<Categoria> categorias = new ArrayList<>();
		    String sql = "SELECT id_categoria, categoria FROM categorias";
		    try (Connection conn = new ConexaoDAO().conectaBD(); 
		         PreparedStatement ps = conn.prepareStatement(sql);
		         ResultSet rs = ps.executeQuery()) {
		        while (rs.next()) {
		            Categoria categoria = new Categoria();
		            categoria.setId(rs.getInt("id_categoria"));
		            categoria.setNome(rs.getString("categoria"));
		            categorias.add(categoria);
		        }
		    }
		    return categorias;
		}
    
}
