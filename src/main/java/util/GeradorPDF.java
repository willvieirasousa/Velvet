package util;

import org.apache.pdfbox.pdmodel.*;
import org.apache.pdfbox.pdmodel.font.*;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;

import DAO.ConexaoDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GeradorPDF {

    public static void gerarRelatorio(OutputStream outputStream) throws IOException {
        Connection conn = conectaBD();
        if (conn != null) {
            try {
                String query = "SELECT * FROM pedido";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);

                PDDocument documento = new PDDocument();
                PDPage pagina = new PDPage();
                documento.addPage(pagina);

                PDPageContentStream conteudoPagina = new PDPageContentStream(documento, pagina);
                conteudoPagina.beginText();
                conteudoPagina.setFont(new PDType1Font(Standard14Fonts.FontName.HELVETICA), 8);
                conteudoPagina.newLineAtOffset(50, 750);

                conteudoPagina.showText("VELVET - Relatório");
                conteudoPagina.newLineAtOffset(0, -20);

                while (rs.next()) {
                    String dado1 = rs.getString("id_pedido");
                    String dado2 = rs.getString("id_cliente");
                    String dado3 = rs.getString("data_criacao");
                    String dado4 = rs.getString("status");
                    String dado5 = rs.getString("total");
                    String dado6 = rs.getString("cod_pedido");

                    conteudoPagina.showText("ID Pedido: " + dado1 + " ");
                    conteudoPagina.showText("ID Cliente: " + dado2 + " ");
                    conteudoPagina.showText("Data de Criação: " + dado3 + " ");
                    conteudoPagina.showText("Status: " + dado4 + " ");
                    conteudoPagina.showText("Total: " + dado5 + " ");
                    conteudoPagina.showText("Código Pedido: " + dado6);
                    conteudoPagina.newLineAtOffset(0, -20); //pulando uma linha
                }

                conteudoPagina.endText();
                conteudoPagina.close();

                documento.save(outputStream);
                documento.close();
                
                System.out.println("PDF gerado com sucesso!");
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            System.out.println("Falha na conexão com o banco de dados.");
        }
    }

    public static Connection conectaBD() {
        Connection conn = null;
        try {
            String url = "jdbc:mysql://localhost:3306/velvet?useSSL=false&serverTimezone=UTC";
            conn = DriverManager.getConnection(url, "root", "");
            System.out.println("Conexão realizada com sucesso!");
        } catch (Exception e) {
            System.out.println("Erro ao realizar conexão");
            e.printStackTrace();
        }
        return conn;
    }
}
