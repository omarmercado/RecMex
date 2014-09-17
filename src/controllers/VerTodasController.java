package controllers;

import hibernate.Nota;
import hibernate.Partido;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.NotasDAO;
import DAO.PaginaDAO;
import DAO.PartidosDAO;

public class VerTodasController extends AbstractController{
	
	PartidosDAO partidosDAO;
	NotasDAO notasDAO;
	PaginaDAO paginaDAO;

	public PartidosDAO getPartidosDAO() {
		return partidosDAO;
	}
	public void setPartidosDAO(PartidosDAO partidosDAO) {
		this.partidosDAO = partidosDAO;
	}
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
		
		String partidoId = request.getParameter("partidoId");
		
		ModelAndView mv = new  ModelAndView();		
		List<Partido> ListaPartidos = partidosDAO.getPartidos();			
		
		
		List<Nota> ListaNotas = null;
		if(partidoId != null && ! partidoId.isEmpty() ){
		    ListaNotas = notasDAO.getNotaPorPartido(partidoId);}
		
		Map<String, String> VersionInfo = paginaDAO.getVersion(request, "VerTodas"); 
		mv.setViewName(VersionInfo.get("View"));

		
	
		mv.addObject("ListaPartidos", ListaPartidos);
		mv.addObject("ListaNotas", ListaNotas);
		
	    String tipo = VersionInfo.get("Tipo").trim();

		paginaDAO.pageView("VerTodas", "",tipo);

		
		return mv;
	}
	

}
