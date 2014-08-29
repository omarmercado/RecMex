package controllers;

import hibernate.Nota;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.ArticulosDAO;
import DAO.NotasDAO;
import DAO.UsuariosDAO;

public class EliminarArticuloController extends AbstractController {

	
	NotasDAO notasDAO;
	ArticulosDAO articulosDAO;
	UsuariosDAO usuariosDAO;

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
	public UsuariosDAO getUsuariosDAO() {
		return usuariosDAO;
	}
	public void setUsuariosDAO(UsuariosDAO usuariosDAO) {
		this.usuariosDAO = usuariosDAO;
	}
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int activeSession = usuariosDAO.revisarSession(request);
		
		if(activeSession == 0){
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/Portada"); 
			
			return mv;
		}
		
		String id = request.getParameter("txtId");
		String notaid = request.getParameter("txtNotaId");
		
		articulosDAO.EliminarArticulo(id);
		Nota nota = notasDAO.getNota(notaid);
		
		
		
		ModelAndView mv = new ModelAndView("VerNota");
		mv.addObject(nota);
		
		return mv;
	}
	
	
	
}
