package controllers;

import hibernate.Nota;
import hibernate.Partido;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.NotasDAO;
import DAO.PartidosDAO;

public class VerTodasController extends AbstractController{
	
	PartidosDAO partidosDAO;
	NotasDAO notasDAO;
	
	public PartidosDAO getPartidosDAO() {
		return partidosDAO;
	}
	public void setPartidosDAO(PartidosDAO partidosDAO) {
		this.partidosDAO = partidosDAO;
	}
	public NotasDAO getNotasDAO() {
		return notasDAO;
	}
	public void setNotasDAO(NotasDAO notasDAO) {
		this.notasDAO = notasDAO;
	}

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String partidoId = request.getParameter("partidoId");
		
		ModelAndView mv = new  ModelAndView();		
		List<Partido> ListaPartidos = partidosDAO.getPartidos();			
		
		
		List<Nota> ListaNotas = null;
		if(partidoId != null && ! partidoId.isEmpty() ){
		    ListaNotas = notasDAO.getNotaPorPartido(partidoId);}
		
		
		  if(request.getHeader("User-Agent").indexOf("Mobile") != -1) {
			    mv.setViewName("mobile/VerTodas");
			  } else {
				    mv.setViewName("/VerTodas");
			  }
		  
		
		mv.addObject("ListaPartidos", ListaPartidos);
		mv.addObject("ListaNotas", ListaNotas);
		
		
		return mv;
	}
	

}
