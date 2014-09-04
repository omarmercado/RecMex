package DAO;

import hibernate.Pagina;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class PaginaDAO {

	SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Pagina getPagina(){		
		
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();	
		
		Pagina pagina = (Pagina)session.get(Pagina.class,  1);		

		session.getTransaction().commit();
		
		return pagina;
	}
	
}
