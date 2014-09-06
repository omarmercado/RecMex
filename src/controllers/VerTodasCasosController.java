package controllers;

import hibernate.Nota;
import hibernate.Partido;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.CasosDAO;
import DAO.PartidosDAO;

public class VerTodasCasosController extends AbstractController{
	
	PartidosDAO partidosDAO;
	CasosDAO casosDAO;
	
	public PartidosDAO getPartidosDAO() {
		return partidosDAO;
	}
	public void setPartidosDAO(PartidosDAO partidosDAO) {
		this.partidosDAO = partidosDAO;
	}
	public CasosDAO getCasosDAO() {
		return casosDAO;
	}
	public void setCasosDAO(CasosDAO casosDAO) {
		this.casosDAO = casosDAO;
	}
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		ModelAndView mv = new  ModelAndView();				
		
		List<Nota> ListaCasos = null;
		
		    ListaCasos = casosDAO.getCasos();	
		
		  if(request.getHeader("User-Agent").indexOf("Mobile") != -1 || request.getHeader("User-Agent").indexOf("Android") != -1) {
			    mv.setViewName("mobile/VerTodasCasos");
			  } else {
				    mv.setViewName("/VerTodasCasos");
			  }
		  
		
		mv.addObject("ListaCasos", ListaCasos);
		
		
		return mv;
	}
	
}
