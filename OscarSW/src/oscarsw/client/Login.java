/**
 * 
 */
package oscarsw.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oscarsw.dao.DAO;
import oscarsw.data.User;

/**
 * @author roni
 *
 */

public class Login extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("nick");
		
		
		if(nick == null){	
			String type = request.getParameter("tipo");
			User user;
			String aux_nick = request.getParameter("nick").trim();
			String pass = request.getParameter("pass").trim();
			if(type.equals("normal")){
				user = (DAO.getInstance()).getCompetitor(aux_nick,pass );
			}
			else{
				user = (DAO.getInstance()).getOrganizer(aux_nick, pass);
			}
			if(user == null){			
				response.sendRedirect("/log.jsp?error=Usuario no encontrado");				
				
			}
			else{
				session.setAttribute("nick", user.getNick());
				if(type.equals("normal")){
					session.setAttribute("type", "competitor");
				}
				else{
					session.setAttribute("type","organizer");
				}
				
				response.sendRedirect("/lista_eventos.jsp");
			}
		}
		else{
			response.sendRedirect("/lista_eventos.jsp");
		}
		//response.sendRedirect("/index.html");
	}
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		HttpSession session = request.getSession();
		session.invalidate();
		
		response.sendRedirect("/lista_eventos.jsp");
	}
}
