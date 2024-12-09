package DTO;

public class Adm {
	private int id_administrador;
	private String nome;
	private String email;
	private String senha;
	private int status;
	public int getId_administrador() {
		return id_administrador;
	}
	public void setId_administrador(int id_administrador) {
		this.id_administrador = id_administrador;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
