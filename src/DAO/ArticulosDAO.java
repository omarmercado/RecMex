package DAO;

import hibernate.Articulo;
import hibernate.Nota;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class ArticulosDAO {
	SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	
	public void newArticulo(Map<String, String> map){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		Nota nota = (Nota) session.get(Nota.class, Integer.parseInt(map.get("notaId")));
		Articulo articulo = new Articulo();
		
		Set<Nota> setNota = new HashSet<Nota>();
		setNota.add(nota);
		
		articulo.setAutor(map.get("autor"));
		articulo.setTitulo(map.get("titulo"));
		articulo.setUrl(map.get("url"));
		articulo.setNota(setNota);
		session.save(articulo);
		
		session.getTransaction().commit();
		
		
	}
	
	public void EliminarArticulo(String id){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		Articulo articulo = (Articulo)session.get(Articulo.class, Integer.parseInt(id));
		session.delete(articulo);
		
		session.getTransaction().commit();

	}
	
	
}
