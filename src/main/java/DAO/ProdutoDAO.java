package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import DTO.Categoria;
import DTO.Marca;
import DTO.Produto;

public class ProdutoDAO {
    private Connection conn;

    public ProdutoDAO(Connection conn) {
        this.conn = conn;
    }

    public ArrayList<Produto> listarProdutos(Number categoria) throws SQLException {
        ArrayList<Produto> produtos = new ArrayList<>();
        // Consulta SQL usando um parâmetro de placeholder (?)
        String sql = "SELECT id_produto, imagem, nome, id_marca, custo, valor, tamanho, id_categoria, capacidade, descricao, estoque " +
                     "FROM produtos WHERE id_categoria = ? and status = 1 LIMIT 12";

        // Usando PreparedStatement para maior segurança
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            // Substituir o placeholder (?) pelo valor do parâmetro `categoria`
            stmt.setObject(1, categoria);
            // Executar a consulta
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Produto produto = new Produto();
                    produto.setId_produto(rs.getInt("id_produto"));
                    produto.setImagem(rs.getString("imagem"));
                    produto.setNome(rs.getString("nome"));
                    produto.setMarca(rs.getInt("id_marca"));
                    produto.setCusto(rs.getString("custo"));
                    produto.setValor(rs.getString("valor"));
                    produto.setTamanho(rs.getString("tamanho"));
                    produto.setCategorias(rs.getInt("id_categoria"));
                    produto.setConteudo(rs.getString("capacidade"));
                    produto.setDesc(rs.getString("descricao"));
                    produto.setEstoque(rs.getString("estoque"));
                    produtos.add(produto);
                    System.out.print("idproduto: " + rs.getString("id_produto"));

                }
            }
        }

        return produtos;
    }
    
    public ArrayList<Produto> listarProdutosADM() throws SQLException {
		ArrayList<Produto> produtos = new ArrayList<>();
		String sql = "SELECT id_produto, imagem, nome, id_marca, custo, valor, tamanho, id_categoria, capacidade, descricao, estoque, status FROM produtos";

		try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
			while (rs.next()) {
				Produto produto = new Produto();
				produto.setId_produto(rs.getInt("id_produto"));
				produto.setImagem(rs.getString("imagem"));
				produto.setNome(rs.getString("nome"));
				produto.setMarca(rs.getInt("id_marca"));
				produto.setCusto(rs.getString("custo"));
				produto.setValor(rs.getString("valor"));
				produto.setTamanho(rs.getString("tamanho"));
				produto.setCategorias(rs.getInt("id_categoria"));
				produto.setConteudo(rs.getString("capacidade"));
				produto.setDesc(rs.getString("descricao"));
				produto.setEstoque(rs.getString("estoque"));
				produto.setStatus(rs.getString("status"));
				
				produtos.add(produto);
			}
		}
		return produtos;
	}
    
    public ArrayList<Produto> listarTodos() throws SQLException {
        ArrayList<Produto> produtos = new ArrayList<>();
        // Consulta SQL usando um parâmetro de placeholder (?)
        String sql = "SELECT id_produto, imagem, nome, id_marca, custo, valor, tamanho, id_categoria, capacidade, descricao, estoque " +
                     "FROM produtos where status = 1 LIMIT 5";

        // Usando PreparedStatement para maior segurança
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {


            // Executar a consulta
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Produto produto = new Produto();
                    produto.setId_produto(rs.getInt("id_produto"));
                    produto.setImagem(rs.getString("imagem"));
                    produto.setNome(rs.getString("nome"));
                    produto.setMarca(rs.getInt("id_marca"));
                    produto.setCusto(rs.getString("custo"));
                    produto.setValor(rs.getString("valor"));
                    produto.setTamanho(rs.getString("tamanho"));
                    produto.setCategorias(rs.getInt("id_categoria"));
                    produto.setConteudo(rs.getString("capacidade"));
                    produto.setDesc(rs.getString("descricao"));
                    produto.setEstoque(rs.getString("estoque"));
                    produtos.add(produto);
                }
            }
        }

        return produtos;
    }    
    
    
    public ArrayList<Produto> listarDetalheProdutos(int id) throws SQLException {
        ArrayList<Produto> produtos = new ArrayList<>();
        // Consulta SQL usando um parâmetro de placeholder (?)
        String sql = "SELECT id_produto, imagem, nome, id_marca, custo, valor, tamanho, id_categoria, capacidade, descricao, estoque " +
                     "FROM produtos where id_produto = ?";

        // Usando PreparedStatement para maior segurança
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setObject(1, id);

            // Executar a consulta
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Produto produto = new Produto();
                    produto.setImagem(rs.getString("imagem"));
                    produto.setNome(rs.getString("nome"));
                    produto.setMarca(rs.getInt("id_marca"));
                    produto.setCusto(rs.getString("custo"));
                    produto.setValor(rs.getString("valor"));
                    produto.setTamanho(rs.getString("tamanho"));
                    produto.setCategorias(rs.getInt("id_categoria"));
                    produto.setConteudo(rs.getString("capacidade"));
                    produto.setDesc(rs.getString("descricao"));
                    produto.setEstoque(rs.getString("estoque"));
                    produto.setId_produto(rs.getInt("id_produto"));

                    produtos.add(produto);
                }
            }
        }

        return produtos;
    }   
    
    
    public boolean atualizaProduto(Produto produto) {
	    String sql = "UPDATE produtos SET nome = ?, id_marca = ?, custo = ?, valor = ?, tamanho = ?, id_categoria = ?, estoque = ?, descricao = ?, status = ? WHERE id_produto = ?";

	    try (Connection conn = new ConexaoDAO().conectaBD(); 
	         PreparedStatement pstm = conn.prepareStatement(sql)) {

	        // Definindo os parâmetros na ordem correta
	    	pstm.setString(1, produto.getNome());
	    	pstm.setInt(2, produto.getMarca());
	    	pstm.setString(3, produto.getCusto());
	    	pstm.setString(4, produto.getValor());
	    	pstm.setString(5, produto.getTamanho());
	    	pstm.setInt(6, produto.getCategorias());
	    	pstm.setString(7, produto.getEstoque());
	    	pstm.setString(8, produto.getDesc());
	    	pstm.setString(9, produto.getStatus()); // status
	    	pstm.setInt(10, produto.getId_produto()); // id_produto


	        // Executando a atualização
	        int linhasAfetadas = pstm.executeUpdate();
	        System.out.println("LINHAS AFTEDAS:" + linhasAfetadas);
	        if (linhasAfetadas > 0) {
	            System.out.println("Produto atualizado com sucesso!");
	            return true;
	        }

	    } catch (SQLException e) {
	        System.err.println("Erro ao atualizar produto no banco de dados: " + e.getMessage());
	        e.printStackTrace();
	    } catch (Exception e) {
	        System.err.println("Erro inesperado ao atualizar produto: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return false; // Retorna false caso ocorra alguma exceção
	}
	
	
	public boolean deletaProduto(Produto produto) {
	    String sql = "DELETE FROM produtos WHERE id_produto = ?";

	    try (Connection conn = new ConexaoDAO().conectaBD(); 
	         PreparedStatement pstm = conn.prepareStatement(sql)) {
	    	
	        pstm.setInt(1, produto.getId_produto());

	        int linhasAfetadas = pstm.executeUpdate();
	        if (linhasAfetadas > 0) {
	            System.out.println("Produto deletado com sucesso!");
	            return true;
	        }

	    } catch (SQLException e) {
	        System.err.println("Erro ao deletar produto no banco de dados: " + e.getMessage());
	        e.printStackTrace();
	    } catch (Exception e) {
	        System.err.println("Erro inesperado ao deletar produto: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return false; // Retorna false caso ocorra alguma exceção
	}

	
	public Produto buscarPorId(int id_produto) {
	    Produto produto = null;
	    
	    String sql = "SELECT * FROM produtos WHERE id_produto = ?";
	    try (Connection conn = new ConexaoDAO().conectaBD(); PreparedStatement pstm = conn.prepareStatement(sql)) {
	        
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setInt(1, id_produto);
	        ResultSet rs = stmt.executeQuery();
	        
	        if (rs.next()) {
	            produto = new Produto();
	            produto.setId_produto(rs.getInt("id_produto"));
	            produto.setNome(rs.getString("nome"));
	            produto.setMarca(rs.getInt("id_marca"));
	            produto.setCusto(rs.getString("custo"));
	            produto.setValor(rs.getString("valor"));
	            produto.setTamanho(rs.getString("tamanho"));
	            produto.setCategorias(rs.getInt("id_categoria"));
	            produto.setEstoque(rs.getString("estoque"));
	            produto.setDesc(rs.getString("descricao"));
	            produto.setStatus(rs.getString("status"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return produto;
	}
	


    
}
