package DAO;

import hibernate.Nota;
import hibernate.Partido;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class PartidosDAO {

	SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	public List<Partido> getPartidos(){
		List<Partido> resultado;
		
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		resultado = session.createQuery("from Partido").list();  

		session.getTransaction().commit();
		
		return resultado;
	}
	
	public List<Map <Partido, List<Nota>>> getAllInfo(){
		List<Partido> resultadoQuery;
		List<Partido> resultado;
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		resultadoQuery = session.createQuery("from Partido").list();  
		
		HashMap<Partido, List<Nota>> map = new HashMap<Partido, List<Nota>>();
		
		ArrayList<Map <Partido, List<Nota>>> response = new ArrayList<Map <Partido, List<Nota>>>();
		
		for (Partido partido : resultadoQuery) {
								
			Query query = session.createQuery("select n.id, n.Titulo from Nota n join n.Partidos p  where p.id = :partidoId order by n.Fecha Desc");
                          query.setParameter("partidoId", partido.getId()).setMaxResults(3) ;
          
			map.put(partido,   query.list());
			
			response.add((Map<Partido, List<Nota>>) map.clone());
			
			map.clear();
		
		}
		
		session.getTransaction().commit();
		return response;
		
	}
}
