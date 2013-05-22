/**
 * 
 */
package oscarsw.client;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oscarsw.dao.DAO;
import oscarsw.data.Event;
import oscarsw.data.Event.Sport;


/**
 * @author roni
 *
 */
public class CreateEvent extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		HttpSession session = request.getSession();
		String organizer = (String) session.getAttribute("nick");
		
		if(organizer == null){
			response.sendRedirect("/lista_eventos.jsp");
			return;
		}
		else{
			String level = (String) session.getAttribute("type");
			if(level.equals("competitor")){
				response.sendRedirect("/lista_eventos.jsp");
				return;
			}
		}
		
		String name = request.getParameter("nombre");
		String city = request.getParameter("localidad");
		String province = request.getParameter("comunidad");
		String place = request.getParameter("lugar");
		String aux_gratis = request.getParameter("es_gratis");
		boolean free;
		float cost = 0;
		if(aux_gratis.equals("si")){
			free = true;
		}
		else{
			free = false;
			cost = Float.parseFloat(request.getParameter("precio"));
		}
		
		String aux_date = request.getParameter("fecha");
		StringTokenizer tok_date = new StringTokenizer(aux_date,"/");
		int day = Integer.parseInt(tok_date.nextToken());
		int month = Integer.parseInt(tok_date.nextToken());
		int year = Integer.parseInt(tok_date.nextToken());
		
		Calendar calendar = new GregorianCalendar();
		calendar.set(year, month, day);
		Date date = new Date(calendar.getTimeInMillis());

		
		String description = request.getParameter("descripcion");
		if(description == null){
			description = "";
		}
		String plus = request.getParameter("adicional");
		if(plus == null){
			plus = "";
		}
		
		String aux_sport = request.getParameter("deporte");
		Sport sport = convertToSport(aux_sport);
		
		String aux_id = request.getParameter("id");
		
		Event event = new Event(name, organizer, city, province, place, date, free, cost, description, plus, sport);
		if(aux_id == null || aux_id.equals("")){
			
			
			(DAO.getInstance()).addEvent(event,organizer);
		}
		else{
			Long id = Long.valueOf(aux_id);
			(DAO.getInstance()).updateEvent(event, id);
		}
		
		response.sendRedirect("/lista_eventos.jsp");
	}
	private Sport convertToSport(String aux){
		Sport sport ;
		if(aux.equals("atletismo")){
			sport = Sport.athletics;
		}
		else if(aux.equals("baloncesto")){
			sport = Sport.basket;
		}
		else if(aux.equals("futbol")){
			sport = Sport.footbal;
		}
		else{
			sport = Sport.other;
		}
		return sport;
	}
}
