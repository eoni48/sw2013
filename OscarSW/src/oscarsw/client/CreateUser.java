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

/**
 * @author roni
 *
 */
public class CreateUser extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		String type = request.getParameter("tipo");
		
		if(type.equals("normal")){
			Competitor user = new Competitor(request.getParameter("nombre"), request.getParameter("pass"), "pepe", "paco", "1");
			(DAO.getInstance()).addCompetitor(user);
		}
		else{
			Organizer user = new Organizer(request.getParameter("nombre"), request.getParameter("pass"), "manolo", "2");
			(DAO.getInstance()).addOrganizer(user);
		}
		
		
		response.sendRedirect("/log.html");
	}

}
