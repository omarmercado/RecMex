package controllers;

import hibernate.Nota;
import hibernate.Partido;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.CasosDAO;
import DAO.PaginaDAO;
import DAO.PartidosDAO;

public class VerTodasCasosController extends AbstractController{
	
	PartidosDAO partidosDAO;
	CasosDAO casosDAO;
	PaginaDAO paginaDAO;

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
	public PaginaDAO getPaginaDAO() {
		return paginaDAO;
	}
	public void setPaginaDAO(PaginaDAO paginaDAO) {
		this.paginaDAO = paginaDAO;
	}
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		ModelAndView mv = new  ModelAndView();				
		
		List<Nota> ListaCasos = null;
		
		    ListaCasos = casosDAO.getCasos();	
		
			Map<String, String> VersionInfo = paginaDAO.getVersion(request, "VerTodasCasos"); 
			mv.setViewName(VersionInfo.get("View"));

	
		  
		
		mv.addObject("ListaCasos", ListaCasos);
		
	    String tipo = VersionInfo.get("Tipo").trim();

		paginaDAO.pageView("VerTodasCasos", "",tipo);

		
		return mv;
	}
	
}
