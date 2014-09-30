package DAO;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import hibernate.PageView;
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
	
	public Map<String, String> getVersion(HttpServletRequest request, String view){
		
		Map<String, String> resultado = new HashMap<String, String>();
		
		String response;
		String tipo;
		
		String header = request.getHeader("User-Agent");
		
		if(header.toLowerCase().indexOf("mobile") != -1 ||
		   header.toLowerCase().indexOf("android") != -1 ||
		   header.toLowerCase().indexOf("phone") != -1 ||
		   header.toLowerCase().indexOf("blackberry") != -1 ||
		   header.toLowerCase().indexOf("mini") != -1 ||
		   header.toLowerCase().indexOf("mobi") != -1||
		   header.toLowerCase().indexOf("ipad") != -1||
		   header.toLowerCase().indexOf("iphone") != -1)
		{		  
			  response = "mobile/"+view;
			  tipo ="M";
		}
		  else{
			  response = "/"+view;
			  tipo ="D";
		  }
		resultado.put("View", response);
		resultado.put("Tipo", tipo);
		
		return resultado;
	}

	
	public void pageView(String pageName, String extraInfo, String Tipo){
	
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		PageView pv = new PageView();
		
		pv.setPagina(pageName);
		pv.setExtraInfo(extraInfo);
		pv.setTipo(Tipo);
		
		session.save(pv);
		
		session.getTransaction().commit(); 

		
	}
	
}
