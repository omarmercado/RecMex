package controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.ArticulosDAO;
import DAO.UsuariosDAO;


public class NewArticuloController extends AbstractController{

	ArticulosDAO articulosDAO;
	UsuariosDAO usuariosDAO;

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
		
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("titulo" ,request.getParameter("txtTitulo"));
		map.put("autor" ,request.getParameter("txtAutor"));
		map.put("url" ,request.getParameter("txtUrl"));
		map.put("notaId" ,request.getParameter("notaId"));
		
		articulosDAO.newArticulo(map);
				
		ModelAndView mv = new ModelAndView("redirect:/VerNota.htm?notaId="+map.get("notaId"));
		mv.addObject(request);
		return mv;
	}
	

	
}
