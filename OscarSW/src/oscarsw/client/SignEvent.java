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

/**
 * @author roni
 *
 */
public class SignEvent extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("nick");
		String id = request.getParameter("id");
		if(nick == null){
			response.sendRedirect("/log.html");
			return;
		}
		(DAO.getInstance()).addSignEvent(Long.valueOf(id), nick);
		response.sendRedirect("/lista_eventos.jsp");
	}
}
