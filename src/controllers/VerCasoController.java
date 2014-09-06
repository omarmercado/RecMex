package controllers;

import hibernate.Caso;
import hibernate.Nota;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.CasosDAO;

public class VerCasoController  extends AbstractController {

	CasosDAO casosDAO;
	
	public CasosDAO getCasosDAO() {
		return casosDAO;
	}
	public void setCasosDAO(CasosDAO casosDAO) {
		this.casosDAO = casosDAO;
	}


	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String casoId = request.getParameter("casoId");		
		Caso caso = casosDAO.getCaso(casoId);
		
		
	
		ModelAndView mv = new ModelAndView();
		
		  if(request.getHeader("User-Agent").indexOf("Mobile") != -1 || request.getHeader("User-Agent").indexOf("Android") != -1) {
			    mv.setViewName("mobile/VerCaso");
			  } else {
				    mv.setViewName("/VerCaso");
			  }
		  
		mv.addObject(caso);
		
		
		return mv;
	}

}
