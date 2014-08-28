package controllers;

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

import DAO.NotasDAO;
import DAO.PartidosDAO;

public class NuevoNotaController extends SimpleFormController{

	public NuevoNotaController() {
		setCommandClass(Nota.class);
		setCommandName("NuevoNotaForm");
	}
	
	PartidosDAO partidosDAO;
    NotasDAO notasDAO;
	
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

 
 String[] partidosId=   request.getParameterValues("partidosId");
 notasDAO.insertNota((Nota)command, partidosId);
 
 return new ModelAndView(getSuccessView());
}
	


}
