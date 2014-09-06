package hibernate;

import java.sql.Date;
import java.util.Set;

public class Caso {
	
	
	int id;
	String Titulo;
	String Descripcion;
	String Imagen;
	Date UltimaActualizacion;
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
	public Date getUltimaActualizacion() {
		return UltimaActualizacion;
	}
	public void setUltimaActualizacion(Date ultimaActualizacion) {
		UltimaActualizacion = ultimaActualizacion;
	}
	public String getImagen() {
		return Imagen;
	}
	public void setImagen(String imagen) {
		this.Imagen = imagen;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((Descripcion == null) ? 0 : Descripcion.hashCode());
		result = prime * result + ((Titulo == null) ? 0 : Titulo.hashCode());
		result = prime
				* result
				+ ((UltimaActualizacion == null) ? 0 : UltimaActualizacion
						.hashCode());
		result = prime * result + id;
		result = prime * result + ((Imagen == null) ? 0 : Imagen.hashCode());
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
		Caso other = (Caso) obj;
		if (Descripcion == null) {
			if (other.Descripcion != null)
				return false;
		} else if (!Descripcion.equals(other.Descripcion))
			return false;
		if (Titulo == null) {
			if (other.Titulo != null)
				return false;
		} else if (!Titulo.equals(other.Titulo))
			return false;
		if (UltimaActualizacion == null) {
			if (other.UltimaActualizacion != null)
				return false;
		} else if (!UltimaActualizacion.equals(other.UltimaActualizacion))
			return false;
		if (id != other.id)
			return false;
		if (Imagen == null) {
			if (other.Imagen != null)
				return false;
		} else if (!Imagen.equals(other.Imagen))
			return false;
		return true;
	}

	
	
	

}
