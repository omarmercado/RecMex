package DAO;

import java.sql.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import hibernate.Articulo;
import hibernate.Nota;
import hibernate.Pagina;
import hibernate.Partido;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class NotasDAO {

	SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	
	public void insertNota(Nota nota, String[] partidos){		
		
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		Set<Partido> partidosSet = new HashSet<Partido>();
		  
		for (String partidoId : partidos) {		
			partidosSet.add((Partido)session.get(Partido.class, Integer.parseInt(partidoId.trim())));			
		}
		
		nota.setPartidos(partidosSet);
		
		Date date = new Date(System.currentTimeMillis());
		nota.setFecha(date);
		
		session.save(nota);
		
		Pagina pagina = (Pagina)session.get(Pagina.class, 1);
		
		Date actualizacion = new Date(System.currentTimeMillis());		
		pagina.setUltimaActualizacion(actualizacion);
		
		session.update(pagina);
		
		session.getTransaction().commit();
		
	}
	
	public Nota getNota(String notaId){		
		
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();	
		Nota nota = (Nota)session.get(Nota.class,  Integer.parseInt(notaId.trim()));		

		session.getTransaction().commit();
		Nota n = nota;
		return n;
	}

	
	public List getNotaPorPartido(String partidoId){		
		
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();	
			

	    List<Nota> ListaNotas =  session.createQuery
        (" select n from Nota n join n.Partidos p where p.id = ? ").setParameter(0, Integer.parseInt(partidoId)).list();

		
		session.getTransaction().commit();
		
		return ListaNotas;
	}
	
	public void EliminarNota(String id){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		Nota nota = (Nota)session.get(Nota.class, Integer.parseInt(id));
		session.delete(nota);
		
		session.getTransaction().commit();

	}
	
	public Nota EditarNota(String id, String titulo, String descripcion){
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		Nota nota = (Nota)session.get(Nota.class, Integer.parseInt(id));
		nota.setTitulo(titulo);
		nota.setDescripcion(descripcion);
		session.save(nota);
		session.getTransaction().commit();

		return nota;
	}
}
