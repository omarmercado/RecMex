package hibernate;

import java.sql.Date;

public class Pagina {

	Pagina(){}
	
	int id;
	Date UltimaActualizacion;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getUltimaActualizacion() {
		return UltimaActualizacion;
	}
	public void setUltimaActualizacion(Date ultimaActualizacion) {
		UltimaActualizacion = ultimaActualizacion;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime
				* result
				+ ((UltimaActualizacion == null) ? 0 : UltimaActualizacion
						.hashCode());
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
		Pagina other = (Pagina) obj;
		if (UltimaActualizacion == null) {
			if (other.UltimaActualizacion != null)
				return false;
		} else if (!UltimaActualizacion.equals(other.UltimaActualizacion))
			return false;
		if (id != other.id)
			return false;
		return true;
	}

	
}
