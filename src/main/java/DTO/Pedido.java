package DTO;

import java.util.List;

public class Pedido {
	
	private int id_pedido;
	private int id_cliente;
	private String status;
	private double total;
	private String cod_pedido;
	private List<ItemPedidoProduto> itens;
	
	public int getId_pedido() {
		return id_pedido;
	}
	public void setId_pedido(int id_pedido) {
		this.id_pedido = id_pedido;
	}
	public int getId_cliente() {
		return id_cliente;
	}
	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getCod_pedido() {
		return cod_pedido;
	}
	public void setCod_pedido(String cod_pedido) {
		this.cod_pedido = cod_pedido;
	}
	public List<ItemPedidoProduto> getItens() {
        return itens;
    }

    public void setItens(List<ItemPedidoProduto> itens) {
        this.itens = itens;
    }
	
	
}
