package controllers;

import hibernate.Nota;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.ArticulosDAO;
import DAO.NotasDAO;

public class EliminarArticuloController extends AbstractController {

	
	NotasDAO notasDAO;
	ArticulosDAO articulosDAO;
	
	public NotasDAO getNotasDAO() {
		return notasDAO;
	}
	public void setNotasDAO(NotasDAO notasDAO) {
		this.notasDAO = notasDAO;
	}	
	public ArticulosDAO getArticulosDAO() {
		return articulosDAO;
	}
	public void setArticulosDAO(ArticulosDAO articulosDAO) {
		this.articulosDAO = articulosDAO;
	}
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String id = request.getParameter("txtId");
		String notaid = request.getParameter("txtNotaId");
		
		articulosDAO.EliminarArticulo(id);
		Nota nota = notasDAO.getNota(notaid);
		
		
		
		ModelAndView mv = new ModelAndView("VerNota");
		mv.addObject(nota);
		
		return mv;
	}
	
	
	
}
