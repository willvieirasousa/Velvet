package DTO;

public class Pagamento {
    private int id_pagamento;
    private int id_pedido;
    private int valor;
    private String numero_card;
    private String data_venc;
    private String nome_titular;
    private String cvv;
    private String metodo;
    
	public int getId_pagamento() {
		return id_pagamento;
	}
	public void setId_pagamento(int id_pagamento) {
		this.id_pagamento = id_pagamento;
	}
	public int getId_pedido() {
		return id_pedido;
	}
	public void setId_pedido(int id_pedido) {
		this.id_pedido = id_pedido;
	}

	public int getValor() {
		return valor;
	}
	public void setValor(int valor) {
		this.valor = valor;
	}
	
	public String getNumero_card() {
		return numero_card;
	}
	public void setNumero_card(String numero_card) {
		this.numero_card = numero_card;
	}
	public String getData_venc() {
		return data_venc;
	}
	public void setData_venc(String data_venc) {
		this.data_venc = data_venc;
	}
	public String getNome_titular() {
		return nome_titular;
	}
	public void setNome_titular(String nome_titular) {
		this.nome_titular = nome_titular;
	}
	public String getCvv() {
		return cvv;
	}
	public void setCvv(String cvv) {
		this.cvv = cvv;
	}
	public String getMetodo() {
		return metodo;
	}
	public void setMetodo(String metodo) {
		this.metodo = metodo;
	}
    
    
    



    

    
}
