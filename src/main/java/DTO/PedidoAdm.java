package DTO;

public class PedidoAdm {
	private int id_pedido;
	private int id_cliente;
	private String status;
	private double total;
	private String cod_pedido;
	private String criacao;
	private int qtd_itens_pedido;
	
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
	public String getCriacao() {
		return criacao;
	}
	public void setCriacao(String criacao) {
		this.criacao = criacao;
	}
	public int getQtd_itens_pedido() {
		return qtd_itens_pedido;
	}
	public void setQtd_itens_pedido(int qtd_itens_pedido) {
		this.qtd_itens_pedido = qtd_itens_pedido;
	}
	
	
	
	
}
