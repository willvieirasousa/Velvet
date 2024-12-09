package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RelatorioDAO {

    public int contaProdutos() {
        String sql = "SELECT COUNT(*) FROM produtos;";
        int quantidadeProdutos = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
             PreparedStatement pstm = conn.prepareStatement(sql);
             ResultSet rs = pstm.executeQuery()) {

            if (rs.next()) {
            	quantidadeProdutos = rs.getInt(1);
            	System.out.println("Produtos no banco: " + quantidadeProdutos);
            }
            


        } catch (SQLException e) {
            System.out.println("Erro ao contar produtos no banco de dados");
            e.printStackTrace();
        }

        return quantidadeProdutos;
    }
        
    public int contaProdutosData(String dataInicial) {
        String sql = "SELECT COUNT(*) FROM produtos WHERE criacao >= ?";
        int quantidadeProdutos = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
                PreparedStatement pstm = conn.prepareStatement(sql)) {

               // Defina o parâmetro como a data inicial passada para o método
               pstm.setString(1, dataInicial);  // A data deve ser no formato 'YYYY-MM-DD'

               ResultSet rs = pstm.executeQuery();

               if (rs.next()) {
            	   quantidadeProdutos = rs.getInt(1);  // Obtém o número de clientes cadastrados
               }

           } catch (SQLException e) {
               System.out.println("Erro ao contar clientes no banco de dados");
               e.printStackTrace();
           }

        return quantidadeProdutos;
    }
    
    public int contaPedidos() {
        String sql = "SELECT COUNT(*) FROM pedido;";
        int quantidadePedidos = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
             PreparedStatement pstm = conn.prepareStatement(sql);
             ResultSet rs = pstm.executeQuery()) {

            if (rs.next()) {
            	quantidadePedidos = rs.getInt(1);
            	System.out.println("Pedidos no banco: " + quantidadePedidos);
            }
            


        } catch (SQLException e) {
            System.out.println("Erro ao contar produtos no banco de dados");
            e.printStackTrace();
        }

        return quantidadePedidos;
    }
    
    public int contaPedidosData(String dataInicial) {
        String sql = "SELECT COUNT(*) FROM pedido WHERE criacao >= ?";
        int quantidadePedidos = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
                PreparedStatement pstm = conn.prepareStatement(sql)) {

               // Defina o parâmetro como a data inicial passada para o método
               pstm.setString(1, dataInicial);  // A data deve ser no formato 'YYYY-MM-DD'

               ResultSet rs = pstm.executeQuery();

               if (rs.next()) {
            	   quantidadePedidos = rs.getInt(1);  // Obtém o número de clientes cadastrados
               }

           } catch (SQLException e) {
               System.out.println("Erro ao contar clientes no banco de dados");
               e.printStackTrace();
           }

        return quantidadePedidos;
    }
       
    public int contaProdutosVendidos() {
        String sql = "SELECT SUM(qtd_itens_pedido) FROM pedido;";
        int quantidadeItensPedidos = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
             PreparedStatement pstm = conn.prepareStatement(sql);
             ResultSet rs = pstm.executeQuery()) {

            if (rs.next()) {
            	quantidadeItensPedidos = rs.getInt(1);
            }
            


        } catch (SQLException e) {
            System.out.println("Erro ao contar produtos no banco de dados");
            e.printStackTrace();
        }

        return quantidadeItensPedidos;
    }
    
    public int contaProdutosVendidosData(String dataInicial) {
        String sql = "SELECT SUM(qtd_itens_pedido) FROM pedido WHERE criacao = ?;";
        int quantidadeItensPedidos = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
                PreparedStatement pstm = conn.prepareStatement(sql)) {

               pstm.setString(1, dataInicial);  
               ResultSet rs = pstm.executeQuery();

               if (rs.next()) {
            	   quantidadeItensPedidos = rs.getInt(1);  
               }

           } catch (SQLException e) {
               System.out.println("Erro ao contar clientes no banco de dados");
               e.printStackTrace();
           }

        return quantidadeItensPedidos;
    }
    
        
    public int estoque() {
        String sql = "SELECT SUM(estoque) FROM produtos";
        int estoque = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
             PreparedStatement pstm = conn.prepareStatement(sql);
             ResultSet rs = pstm.executeQuery()) {

            if (rs.next()) {
            	estoque = rs.getInt(1);
            	System.out.println("Produtos em estoque: " + estoque);
            }
            


        } catch (SQLException e) {
            System.out.println("Erro ao contar produtos no banco de dados");
            e.printStackTrace();
        }

        return estoque;
    }
    
    public int estoqueData(String dataInicial) {
        String sql = "SELECT SUM(estoque) FROM produtos WHERE criacao >= ?";
        int estoque = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
                PreparedStatement pstm = conn.prepareStatement(sql)) {

               // Defina o parâmetro como a data inicial passada para o método
               pstm.setString(1, dataInicial);  // A data deve ser no formato 'YYYY-MM-DD'

               ResultSet rs = pstm.executeQuery();

               if (rs.next()) {
            	   estoque = rs.getInt(1);  // Obtém o número de clientes cadastrados
               }

           } catch (SQLException e) {
               System.out.println("Erro ao contar clientes no banco de dados");
               e.printStackTrace();
           }

        return estoque;
    }
    
    public double getTotalVendas() {
        String sql = "SELECT SUM(total) FROM pedido";
        int totalVendas = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
             PreparedStatement pstm = conn.prepareStatement(sql);
             ResultSet rs = pstm.executeQuery()) {

            if (rs.next()) {
            	totalVendas = rs.getInt(1);
            	System.out.println("Total em vendas: " + totalVendas);
            }
            


        } catch (SQLException e) {
            System.out.println("Erro ao contar produtos no banco de dados");
            e.printStackTrace();
        }

        return totalVendas;
    }
    
    public double getTotalVendasData(String dataInicial) {
        String sql = "SELECT SUM(total) FROM pedido WHERE criacao >= ?";
        double totalVendas = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
                PreparedStatement pstm = conn.prepareStatement(sql)) {

               // Defina o parâmetro como a data inicial passada para o método
               pstm.setString(1, dataInicial);  // A data deve ser no formato 'YYYY-MM-DD'

               ResultSet rs = pstm.executeQuery();

               if (rs.next()) {
            	   totalVendas = rs.getInt(1);  // Obtém o número de clientes cadastrados
               }

           } catch (SQLException e) {
               System.out.println("Erro ao contar clientes no banco de dados");
               e.printStackTrace();
           }

        return totalVendas;
    }
    
    public int getTotalCliente() {

        String sql = "SELECT COUNT(*) FROM clientes";
        int clientesCadastrados = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
             PreparedStatement pstm = conn.prepareStatement(sql);
             ResultSet rs = pstm.executeQuery()) {

            if (rs.next()) {
            	clientesCadastrados = rs.getInt(1);
            }
            


        } catch (SQLException e) {
            System.out.println("Erro ao contar produtos no banco de dados");
            e.printStackTrace();
        }

        return clientesCadastrados;
    }
    
    public int getTotalClienteData(String dataInicial) {
        String sql = "SELECT COUNT(*) FROM clientes WHERE criacao >= ?";
        int clientesCadastrados = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
             PreparedStatement pstm = conn.prepareStatement(sql)) {

            // Defina o parâmetro como a data inicial passada para o método
            pstm.setString(1, dataInicial);  // A data deve ser no formato 'YYYY-MM-DD'

            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {
                clientesCadastrados = rs.getInt(1);  // Obtém o número de clientes cadastrados
            }

        } catch (SQLException e) {
            System.out.println("Erro ao contar clientes no banco de dados");
            e.printStackTrace();
        }

        return clientesCadastrados;
    }
    
    public int getProdutosEntregues() {
        String sql = "SELECT COUNT(*) FROM pedido WHERE status = 'entregue' OR 'Entregue'";
        int pedidosEntregues = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
             PreparedStatement pstm = conn.prepareStatement(sql);
             ResultSet rs = pstm.executeQuery()) {

            if (rs.next()) {
            	pedidosEntregues = rs.getInt(1);
            }
            


        } catch (SQLException e) {
            System.out.println("Erro ao contar produtos no banco de dados");
            e.printStackTrace();
        }

        return pedidosEntregues;
    }
    
    public int getProdutosEntreguesData(String dataInicial) {
        String sql = "SELECT COUNT(*) FROM pedido WHERE status = 'Entregue' AND criacao >= ?";
        int pedidosEntregues = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
                PreparedStatement pstm = conn.prepareStatement(sql)) {

               // Defina o parâmetro como a data inicial passada para o método
               pstm.setString(1, dataInicial);  // A data deve ser no formato 'YYYY-MM-DD'

               ResultSet rs = pstm.executeQuery();

               if (rs.next()) {
            	   pedidosEntregues = rs.getInt(1);  // Obtém o número de clientes cadastrados
               }

           } catch (SQLException e) {
               System.out.println("Erro ao contar clientes no banco de dados");
               e.printStackTrace();
           }

        return pedidosEntregues;
    }
    
    public int getAvaliacoes() { //pega quantidade de avaliações
        String sql = "SELECT COUNT(*) FROM avaliacoes";
        int avaliacoes = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
             PreparedStatement pstm = conn.prepareStatement(sql);
             ResultSet rs = pstm.executeQuery()) {

            if (rs.next()) {
            	avaliacoes = rs.getInt(1);
            }
            


        } catch (SQLException e) {
            System.out.println("Erro ao contar produtos no banco de dados");
            e.printStackTrace();
        }

        return avaliacoes;
    }
    
    public int getAvaliacoesData(String dataInicial) { //pega quantidade de avaliações
        String sql = "SELECT COUNT(*) FROM avaliacoes WHERE data >= ?";
        int avaliacoes = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
                PreparedStatement pstm = conn.prepareStatement(sql)) {

               // Defina o parâmetro como a data inicial passada para o método
               pstm.setString(1, dataInicial);  // A data deve ser no formato 'YYYY-MM-DD'

               ResultSet rs = pstm.executeQuery();

               if (rs.next()) {
            	   avaliacoes = rs.getInt(1);  // Obtém o número de clientes cadastrados
               }

           } catch (SQLException e) {
               System.out.println("Erro ao contar clientes no banco de dados");
               e.printStackTrace();
           }

        return avaliacoes;
    }
    
    public int getTotalEstrelas() { //aqui soma todas as estrelas de todas as avaliações
        String sql = "SELECT SUM(estrela) FROM avaliacoes";
        int estrelas = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
             PreparedStatement pstm = conn.prepareStatement(sql);
             ResultSet rs = pstm.executeQuery()) {

            if (rs.next()) {
            	estrelas = rs.getInt(1);
            }
            


        } catch (SQLException e) {
            System.out.println("Erro ao contar produtos no banco de dados");
            e.printStackTrace();
        }

        return estrelas;
    }
    
    public int getTotalEstrelasData(String dataInicial) { //aqui soma todas as estrelas de todas as avaliações
        String sql = "SELECT SUM(estrela) FROM avaliacoes WHERE data >= ?";
        int estrelas = 0;

        try (Connection conn = new ConexaoDAO().conectaBD();
                PreparedStatement pstm = conn.prepareStatement(sql)) {

               // Defina o parâmetro como a data inicial passada para o método
               pstm.setString(1, dataInicial);  // A data deve ser no formato 'YYYY-MM-DD'

               ResultSet rs = pstm.executeQuery();

               if (rs.next()) {
            	   estrelas = rs.getInt(1);  // Obtém o número de clientes cadastrados
               }

           } catch (SQLException e) {
               System.out.println("Erro ao contar clientes no banco de dados");
               e.printStackTrace();
           }

        return estrelas;
    }
    
        
    

}
