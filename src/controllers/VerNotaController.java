package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.Nota;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.NotasDAO;

public class VerNotaController extends AbstractController {

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

		String notaId = request.getParameter("notaId");		
		Nota nota = notasDAO.getNota(notaId);
		
		
	
		ModelAndView mv = new ModelAndView();
		
		  if(request.getHeader("User-Agent").indexOf("Mobile") != -1) {
			    mv.setViewName("mobile/VerNota");
			  } else {
				    mv.setViewName("/VerNota");
			  }
		  
		mv.addObject(nota);
		
		
		return mv;
	}

}
