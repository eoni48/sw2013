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
import oscarsw.data.Competitor;

/**
 * @author roni
 *
 */
public class SignEvent extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("nick");
		String level = (String) session.getAttribute("type");
		String id = request.getParameter("id");
		
		
		
		if(nick == null){
			response.sendRedirect("/log.jsp");
			return;
		}
		else if(level.equals("organizer")){
			response.sendRedirect("/lista_eventos.jsp");
			return;
		}
		else{
			Competitor user = (DAO.getInstance()).getCompetitor(nick);
			if(user == null || !user.isSign(Long.valueOf(id))){
				response.sendRedirect("/lista_eventos.jsp");
				return;
			}
		}
		(DAO.getInstance()).addSignEvent(Long.valueOf(id), nick);
		response.sendRedirect("/lista_eventos.jsp");
	}
}
