package DTO;

public class ItemCarrinho {
	private int idCarrinho;
	private int idProduto;
	private String emailCliente;
	private int quantidade;
	private double total;

	public ItemCarrinho(int idCarrinho, int idProduto, String emailCliente, int quantidade, double total) {
		this.idCarrinho = idCarrinho;
		this.idProduto = idProduto;
		this.emailCliente = emailCliente;
		this.quantidade = quantidade;
		this.total = total;
	}
	
	public ItemCarrinho() {

	}

	public int getIdCarrinho() {
		return idCarrinho;
	}

	public void setIdCarrinho(int idCarrinho) {
		this.idCarrinho = idCarrinho;
	}

	public int getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}

	public String getEmailCliente() {
		return emailCliente;
	}

	public void setEmailCliente(String emailCliente) {
		this.emailCliente = emailCliente;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}
}
