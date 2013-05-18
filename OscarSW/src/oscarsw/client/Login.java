/**
 * 
 */
package oscarsw.client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oscarsw.dao.DAO;
import oscarsw.data.User;

/**
 * @author roni
 *
 */

public class Login extends HttpServlet{

	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		User user = (DAO.getInstance()).getUser(request.getParameter("nombre"), request.getParameter("pass"));
		PrintWriter out = response.getWriter();
		if(user == null){			
			out.println("Tetas");
		}
		else{
			out.println("BIEEEEN");
		}
		//response.sendRedirect("/index.html");
	}

}
