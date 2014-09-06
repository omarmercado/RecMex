package DAO;

import hibernate.Articulo;
import hibernate.Caso;
import hibernate.Nota;
import hibernate.Pagina;

import java.sql.Date;
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
	
	public void newArticuloCaso(Map<String, String> map){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		Caso caso = (Caso) session.get(Caso.class, Integer.parseInt(map.get("casoId")));
		Articulo articulo = new Articulo();
		
		Set<Caso> setCaso = new HashSet<Caso>();
		setCaso.add(caso);
		
		articulo.setAutor(map.get("autor"));
		articulo.setTitulo(map.get("titulo"));
		articulo.setUrl(map.get("url"));
		articulo.setCaso(setCaso);
		session.save(articulo);
		
		Date date = new Date(System.currentTimeMillis());
		caso.setUltimaActualizacion(date);
		session.saveOrUpdate(caso);
		
        Pagina pagina = new Pagina();
		Date actualizacion = new Date(System.currentTimeMillis());		
		pagina.setUltimaActualizacion(actualizacion);
		pagina.setId(1);		
		session.saveOrUpdate(pagina);
		
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
