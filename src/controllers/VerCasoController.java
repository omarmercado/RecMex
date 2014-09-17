package controllers;

import java.util.Map;

import hibernate.Caso;
import hibernate.Nota;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.CasosDAO;
import DAO.PaginaDAO;

public class VerCasoController  extends AbstractController {

	CasosDAO casosDAO;
	PaginaDAO paginaDAO;

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

		String casoId = request.getParameter("casoId");		
		Caso caso = casosDAO.getCaso(casoId);
		
		
	
		ModelAndView mv = new ModelAndView();
		
		Map<String, String> VersionInfo = paginaDAO.getVersion(request, "VerCaso"); 
		mv.setViewName(VersionInfo.get("View"));


		  
		mv.addObject(caso);
		
	    String tipo = VersionInfo.get("Tipo").trim();

		paginaDAO.pageView("VerCaso", casoId ,tipo);

		
		return mv;
	}

}
