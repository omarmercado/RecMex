package DAO;

import hibernate.Caso;
import hibernate.Nota;
import hibernate.Pagina;
import hibernate.Partido;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class CasosDAO {
	

	SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	
	public void insertCaso(Caso caso, String[] partidos){		
		
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		Set<Partido> partidosSet = new HashSet<Partido>();
		  
		for (String partidoId : partidos) {		
			partidosSet.add((Partido)session.get(Partido.class, Integer.parseInt(partidoId.trim())));			
		}
		
		caso.setPartidos(partidosSet);
		
		Date date = new Date(System.currentTimeMillis());
		caso.setUltimaActualizacion(date);
		
		session.save(caso);
		
		Pagina pagina = new Pagina();
		
		Date actualizacion = new Date(System.currentTimeMillis());		
		pagina.setUltimaActualizacion(actualizacion);
		pagina.setId(1);
		
		session.saveOrUpdate(pagina);
		
		session.getTransaction().commit();
		
	}
	
	public Caso getCaso(String casoId){		
		
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();	
		Caso caso = (Caso)session.get(Caso.class,  Integer.parseInt(casoId.trim()));		

		session.getTransaction().commit();
		Caso c = caso;
		return c;
	}
	
	public Caso EditarCaso(String id, String titulo, String descripcion){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		Caso caso = (Caso)session.get(Caso.class, Integer.parseInt(id));
		caso.setTitulo(titulo);
		caso.setDescripcion(descripcion);
		session.save(caso);
		session.getTransaction().commit();

		return caso;
	}

	public void EliminarCaso(String id){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		Caso caso = (Caso)session.get(Caso.class, Integer.parseInt(id));
		session.delete(caso);
		
		session.getTransaction().commit();

	}
	
	public List getCasos(){		
		
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();	
			

	    List<Caso> ListaCasos =  session.createQuery
        (" select c from Caso c ").list();

		
		session.getTransaction().commit();
		
		return ListaCasos;
	}
	
	
}
