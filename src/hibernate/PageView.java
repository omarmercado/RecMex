package hibernate;

public class PageView {
	
	public PageView() {}
	
	int id;
	String Pagina;
	String ExtraInfo;
	String Tipo;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPagina() {
		return Pagina;
	}
	public void setPagina(String pagina) {
		Pagina = pagina;
	}
	public String getExtraInfo() {
		return ExtraInfo;
	}
	public void setExtraInfo(String extraInfo) {
		ExtraInfo = extraInfo;
	}
	public String getTipo() {
		return Tipo;
	}
	public void setTipo(String tipo) {
		Tipo = tipo;
	}
	
	

}
