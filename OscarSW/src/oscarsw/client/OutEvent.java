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
import oscarsw.data.Event;

/**
 * @author roni
 *
 */
public class OutEvent extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("nick");
		String type = (String)session.getAttribute("type");
		String aux_id = request.getParameter("id");
		
		Long id = Long.valueOf(aux_id);
				
		if(nick == null || type == null){
			response.sendRedirect("/lista_eventos.jsp");
			return;
		}
		if(type.equals("organizador")){
			response.sendRedirect("/lista_eventos.jsp");
			return;
		}
		
		Competitor user = (DAO.getInstance()).getCompetitor(nick);
		Event event = (DAO.getInstance()).getEvent(id);
		if(user == null || event == null){
			response.sendRedirect("/lista_eventos.jsp");
			return;
		}
		if(user.isSign(id) && event.isSign(nick)){
			(DAO.getInstance()).removeSignEvent(id, nick);
		}
		response.sendRedirect("/lista_eventos.jsp");
	}
}
