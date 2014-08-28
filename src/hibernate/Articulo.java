package hibernate;

import java.util.Set;

public class Articulo {
	
	public Articulo(){}
	
	int id;
	Set<Nota> Nota;
	String Titulo;
	String Autor;
	String Url;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Set<Nota> getNota() {
		return Nota;
	}
	public void setNota(Set<Nota> nota) {
		Nota = nota;
	}
	public String getTitulo() {
		return Titulo;
	}
	public void setTitulo(String titulo) {
		Titulo = titulo;
	}
	public String getAutor() {
		return Autor;
	}
	public void setAutor(String autor) {
		Autor = autor;
	}
	public String getUrl() {
		return Url;
	}
	public void setUrl(String url) {
		Url = url;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Autor == null) ? 0 : Autor.hashCode());
		result = prime * result + ((Titulo == null) ? 0 : Titulo.hashCode());
		result = prime * result + ((Url == null) ? 0 : Url.hashCode());
		result = prime * result + id;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Articulo other = (Articulo) obj;
		if (Autor == null) {
			if (other.Autor != null)
				return false;
		} else if (!Autor.equals(other.Autor))
			return false;
		if (Titulo == null) {
			if (other.Titulo != null)
				return false;
		} else if (!Titulo.equals(other.Titulo))
			return false;
		if (Url == null) {
			if (other.Url != null)
				return false;
		} else if (!Url.equals(other.Url))
			return false;
		if (id != other.id)
			return false;
		return true;
	}


	
    
}
