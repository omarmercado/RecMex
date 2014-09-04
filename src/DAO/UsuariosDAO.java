package DAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import helpers.Hash5;
import hibernate.Usuario;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class UsuariosDAO {

	SessionFactory sessionFactory;
	Hash5 hash5;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Hash5 getHash5() {
		return hash5;
	}
	public void setHash5(Hash5 hash5) {
		this.hash5 = hash5;
	}
	
	
	public int getUsuario(String Email, String Contrasena){
		
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		Query query = session.createQuery("from Usuario u  where u.Email = :Email and u.Contrasena = :Contrasena ");
        query.setParameter("Email", hash5.getMd5Digest(Email)) ;
        query.setParameter("Contrasena", hash5.getMd5Digest(Contrasena));
        
        int res = query.list().size();
		
		session.getTransaction().commit();
		
	return res;	
	}
	
	public int revisarSession(HttpServletRequest request){
		
		int res = 1;
		
		HttpSession session = request.getSession();
		
		Integer usuario = (Integer) session.getAttribute("usuario");
		
		if(usuario == null || usuario == 0){			
			res = 0;			
		}
		  

		return res;
	}
	
}
