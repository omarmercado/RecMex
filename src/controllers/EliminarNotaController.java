package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.NotasDAO;

public class EliminarNotaController  extends AbstractController {

	
	NotasDAO notasDAO;
	
	public NotasDAO getNotasDAO() {
		return notasDAO;
	}
	public void setNotasDAO(NotasDAO notasDAO) {
		this.notasDAO = notasDAO;
	}
	
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String id = request.getParameter("txtId");
		
		notasDAO.EliminarNota(id);

		ModelAndView mv = new ModelAndView("redirect:/Portada.htm");	
		return mv;
	}

}
