/**
 * 
 */
package oscarsw.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oscarsw.dao.DAO;
import oscarsw.data.Competitor;
import oscarsw.data.Organizer;
import oscarsw.data.User;

/**
 * @author roni
 *
 */
public class CreateUser extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		String type = request.getParameter("tipo");
		String nick = request.getParameter("nick");
		String pass = request.getParameter("pass");
		
		
		boolean fail = false;
		User aux =	(DAO.getInstance()).getCompetitor(nick);
		if(aux != null){
			fail = true;
		}
		else{
			aux =	(DAO.getInstance()).getOrganizer(nick);
			if(aux != null){
				fail = true;
			}
		}
		if(fail){
			response.sendRedirect("/formulario_usuario.jsp?error=Ese usuario ya existe");
			return;
		}
		
		if(type.equals("normal")){
			Competitor user = new Competitor(nick, pass, "pepe");
			(DAO.getInstance()).addCompetitor(user);
		}
		else{
			Organizer user = new Organizer(nick, pass, "manolo", "2");
			(DAO.getInstance()).addOrganizer(user);
		}
		
		
		response.sendRedirect("/log.html");
	}

}
