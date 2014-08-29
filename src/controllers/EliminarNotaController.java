package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.NotasDAO;
import DAO.UsuariosDAO;

public class EliminarNotaController  extends AbstractController {

	
	NotasDAO notasDAO;
	UsuariosDAO usuariosDAO;

	public NotasDAO getNotasDAO() {
		return notasDAO;
	}
	public void setNotasDAO(NotasDAO notasDAO) {
		this.notasDAO = notasDAO;
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
		
		notasDAO.EliminarNota(id);

		ModelAndView mv = new ModelAndView("redirect:/Portada.htm");	
		return mv;
	}

}
