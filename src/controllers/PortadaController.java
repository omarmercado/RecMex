package controllers;

import hibernate.Nota;
import hibernate.Partido;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.PartidosDAO;


public class PortadaController extends AbstractController {

	PartidosDAO partidosDAO;
		
	public PartidosDAO getPartidosDAO() {
		return partidosDAO;
	}
	public void setPartidosDAO(PartidosDAO partidosDAO) {
		this.partidosDAO = partidosDAO;
	}



	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		List < Map<Partido,List<Nota>>> partidosTodos = new ArrayList<Map<Partido,List<Nota>>>();
		
		partidosTodos = partidosDAO.getAllInfo();
				
		List< Map<Partido,List<Nota>>> ListaPartidos1 =  partidosTodos.subList(0, 4); 
		List< Map<Partido,List<Nota>>> ListaPartidos2 = partidosTodos.subList(4, partidosTodos.size());		
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println(request.getHeader("User-Agent"));
		
		  if(request.getHeader("User-Agent").indexOf("Mobile") != -1 || request.getHeader("User-Agent").indexOf("Android") != -1) {
			    mv.setViewName("mobile/Portada");
				mv.addObject("ListaPartidos1",partidosTodos);
				
					    			    
			  } else {
				    mv.setViewName("/Portada");
					mv.addObject("ListaPartidos1",ListaPartidos1);
					mv.addObject("ListaPartidos2",ListaPartidos2);
			  }
		
		
	
		
		
	
		return mv;
	}


	
	
}
