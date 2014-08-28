package hibernate;

public class Partido {

	Partido(){}
	
	int id;
	String Iniciales;
	String Nombre;
	String Imagen;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIniciales() {
		return Iniciales;
	}
	public void setIniciales(String iniciales) {
		Iniciales = iniciales;
	}
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	public String getImagen() {
		return Imagen;
	}
	public void setImagen(String imagen) {
		Imagen = imagen;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Imagen == null) ? 0 : Imagen.hashCode());
		result = prime * result
				+ ((Iniciales == null) ? 0 : Iniciales.hashCode());
		result = prime * result + ((Nombre == null) ? 0 : Nombre.hashCode());
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
		Partido other = (Partido) obj;
		if (Imagen == null) {
			if (other.Imagen != null)
				return false;
		} else if (!Imagen.equals(other.Imagen))
			return false;
		if (Iniciales == null) {
			if (other.Iniciales != null)
				return false;
		} else if (!Iniciales.equals(other.Iniciales))
			return false;
		if (Nombre == null) {
			if (other.Nombre != null)
				return false;
		} else if (!Nombre.equals(other.Nombre))
			return false;
		if (id != other.id)
			return false;
		return true;
	}



}
