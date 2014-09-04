package hibernate;

import java.sql.Date;
import java.util.Set;

public class Nota {

	Nota(){}
	
	int id;
	String Titulo;
	String Descripcion;
	Date Fecha;
	Set<Partido> Partidos;
    Set<Articulo> Articulos;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitulo() {
		return Titulo;
	}
	public void setTitulo(String titulo) {
		Titulo = titulo;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}
	public Set<Partido> getPartidos() {
		return Partidos;
	}
	public void setPartidos(Set<Partido> partidos) {
		Partidos = partidos;
	}
	public Set<Articulo> getArticulos() {
		return Articulos;
	}
	public void setArticulos(Set<Articulo> articulos) {
		Articulos = articulos;
	}
	public Date getFecha() {
		return Fecha;
	}
	public void setFecha(Date fecha) {
		Fecha = fecha;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((Descripcion == null) ? 0 : Descripcion.hashCode());
		result = prime * result + ((Fecha == null) ? 0 : Fecha.hashCode());
		result = prime * result + ((Titulo == null) ? 0 : Titulo.hashCode());
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
		Nota other = (Nota) obj;
		if (Descripcion == null) {
			if (other.Descripcion != null)
				return false;
		} else if (!Descripcion.equals(other.Descripcion))
			return false;
		if (Fecha == null) {
			if (other.Fecha != null)
				return false;
		} else if (!Fecha.equals(other.Fecha))
			return false;
		if (Titulo == null) {
			if (other.Titulo != null)
				return false;
		} else if (!Titulo.equals(other.Titulo))
			return false;
		if (id != other.id)
			return false;
		return true;
	}


    
}
