package controllers;

import hibernate.Caso;
import hibernate.Nota;
import hibernate.Partido;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import DAO.CasosDAO;
import DAO.NotasDAO;
import DAO.PartidosDAO;
import DAO.UsuariosDAO;

public class NuevoCasoController extends SimpleFormController{

	public NuevoCasoController() {
		setCommandClass(Caso.class);
		setCommandName("NuevoCasoForm");
	}
	
	PartidosDAO partidosDAO;
    CasosDAO casosDAO;
	UsuariosDAO usuariosDAO;

	public PartidosDAO getPartidosDAO() {
		return partidosDAO;
	}
	public void setPartidosDAO(PartidosDAO partidosDAO) {
		this.partidosDAO = partidosDAO;
	}	
	public CasosDAO getCasosDAO() {
		return casosDAO;
	}
	public void setCasosDAO(CasosDAO casosDAO) {
		this.casosDAO = casosDAO;
	}
	public UsuariosDAO getUsuariosDAO() {
		return usuariosDAO;
	}
	public void setUsuariosDAO(UsuariosDAO usuariosDAO) {
		this.usuariosDAO = usuariosDAO;
	}
	
	@Override
	protected Map<String, List<Partido>> referenceData(HttpServletRequest request ) throws Exception {
	 			
		Map<String, List<Partido>> resultado = new HashMap<String, List<Partido>>();		
		List<Partido> ListaPartidos = partidosDAO.getPartidos();			
		resultado.put("ListaPartidos", ListaPartidos);

		return resultado;
	}
	

	
	
@Override
protected ModelAndView onSubmit(HttpServletRequest request,
		HttpServletResponse response, Object command, BindException errors)
		throws Exception {

	int activeSession = usuariosDAO.revisarSession(request);
	
	if(activeSession == 0){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/Portada"); 
		
		return mv;
	}
	
 
 String[] partidosId=   request.getParameterValues("partidosId");
 casosDAO.insertCaso((Caso)command, partidosId);
 
 return new ModelAndView(getSuccessView());
}
	



}
