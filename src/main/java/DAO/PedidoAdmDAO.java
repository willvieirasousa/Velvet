package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import DTO.PedidoAdm;

public class PedidoAdmDAO {

    private Connection conn;

    public PedidoAdmDAO(Connection conn) {
        this.conn = conn;
    }

    public ArrayList<PedidoAdm> listarPedidos() throws SQLException {
        ArrayList<PedidoAdm> pedidos = new ArrayList<>();
        String sql = "SELECT id_pedido, id_cliente, status, total, cod_pedido, criacao, qtd_itens_pedido FROM pedido";

        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                PedidoAdm pedido = new PedidoAdm();
                pedido.setId_pedido(rs.getInt("id_pedido"));
                pedido.setId_cliente(rs.getInt("id_cliente"));
                pedido.setStatus(rs.getString("status"));
                pedido.setTotal(rs.getDouble("total"));
                pedido.setCod_pedido(rs.getString("cod_pedido"));
                pedido.setCriacao(rs.getString("criacao"));
                pedido.setQtd_itens_pedido(rs.getInt("qtd_itens_pedido"));

                pedidos.add(pedido);
            }
        }
        return pedidos;
    }
}
