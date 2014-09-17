package controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.Nota;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.NotasDAO;
import DAO.PaginaDAO;

public class VerNotaController extends AbstractController {

	NotasDAO notasDAO;
	PaginaDAO paginaDAO;

	public NotasDAO getNotasDAO() {
		return notasDAO;
	}
	public void setNotasDAO(NotasDAO notasDAO) {
		this.notasDAO = notasDAO;
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

		String notaId = request.getParameter("notaId");		
		Nota nota = notasDAO.getNota(notaId);
		
		
	
		ModelAndView mv = new ModelAndView();
		
		Map<String, String> VersionInfo = paginaDAO.getVersion(request, "VerNota"); 
		mv.setViewName(VersionInfo.get("View"));


		mv.addObject(nota);
	    String tipo = VersionInfo.get("Tipo").trim();

		paginaDAO.pageView("VerNota",notaId, tipo);

		
		return mv;
	}

}
