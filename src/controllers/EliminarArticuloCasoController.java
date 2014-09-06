package controllers;

import hibernate.Caso;
import hibernate.Nota;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.ArticulosDAO;
import DAO.CasosDAO;
import DAO.UsuariosDAO;

public class EliminarArticuloCasoController extends AbstractController {

	
	CasosDAO casosDAO;
	ArticulosDAO articulosDAO;
	UsuariosDAO usuariosDAO;

	
	public CasosDAO getCasosDAO() {
		return casosDAO;
	}
	public void setCasosDAO(CasosDAO casosDAO) {
		this.casosDAO = casosDAO;
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
		String casoid = request.getParameter("txtCasoId");
		
		articulosDAO.EliminarArticulo(id);
		Caso caso = casosDAO.getCaso(casoid);
		
		
		
		ModelAndView mv = new ModelAndView("VerCaso");
		mv.addObject(caso);
		
		return mv;
	}
}
