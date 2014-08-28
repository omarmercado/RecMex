package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import DAO.UsuariosDAO;

public class UsuarioController extends AbstractController{

	UsuariosDAO usuariosDAO;
	
	public UsuariosDAO getUsuariosDAO() {
		return usuariosDAO;
	}
	public void setUsuariosDAO(UsuariosDAO usuariosDAO) {
		this.usuariosDAO = usuariosDAO;
	}


	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String Email = request.getParameter("txtEmail");
		String Contrasena = request.getParameter("txtContrasena");
		
		int usuario = usuariosDAO.getUsuario(Email, Contrasena);
		
		ModelAndView mv = new ModelAndView("redirect:/Portada.htm");
		
		HttpSession session = request.getSession();
		session.setAttribute("usuario",usuario);
			
		
		
		return mv;
	}
	
	
	
}
