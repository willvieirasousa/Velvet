package DTO;

public class ItemPedidoProduto {
    private int idPedidoProduto;
    private int idProduto;
    private String nomeProduto;
    private int quantidade;
    private double precoUnitario;

    // Getters e Setters
    public int getIdPedidoProduto() {
        return idPedidoProduto;
    }

    public void setIdPedidoProduto(int idPedidoProduto) {
        this.idPedidoProduto = idPedidoProduto;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getPrecoUnitario() {
        return precoUnitario;
    }

    public void setPrecoUnitario(double precoUnitario) {
        this.precoUnitario = precoUnitario;
    }
}
