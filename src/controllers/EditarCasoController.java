package controllers;

import hibernate.Caso;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import DAO.CasosDAO;
import DAO.UsuariosDAO;

public class EditarCasoController extends AbstractController {
	
	
	UsuariosDAO usuariosDAO;
	CasosDAO casosDAO;

	public UsuariosDAO getUsuariosDAO() {
		return usuariosDAO;
	}
	public void setUsuariosDAO(UsuariosDAO usuariosDAO) {
		this.usuariosDAO = usuariosDAO;
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
		
		int activeSession = usuariosDAO.revisarSession(request);
		
		if(activeSession == 0){
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/Portada"); 
			
			return mv;
		}
		

		String id = request.getParameter("txtId");
		String titulo = request.getParameter("txtTitulo");
		String descripcion= request.getParameter("txtDescripcion");
		
		Caso caso = casosDAO.EditarCaso(id, titulo, descripcion);
		
		ModelAndView mv = new ModelAndView("VerCaso");
		mv.addObject(caso);

		return mv;
	}

	

}
