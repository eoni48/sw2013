/**
 * 
 */
package oscarsw.dao;

import java.util.List;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;
import javax.jdo.Query;

import oscarsw.data.Competitor;
import oscarsw.data.Event;
import oscarsw.data.Organizer;
import oscarsw.data.User;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

/**
 * @author roni
 *
 */
public class DAO {
	private static DAO singleton;
	private PersistenceManagerFactory pmfInstance;

	
	private DAO(){
		 pmfInstance =  JDOHelper.getPersistenceManagerFactory("transactions-optional");
	}
	public static DAO getInstance(){
		if(singleton == null){
			singleton = new DAO();
		}
		return singleton;
	}
	public void addCompetitor(Competitor user){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		try{
			pm.makePersistent(user);
		}
		finally{
			pm.close();
		}
	}
	public void addOrganizer(Organizer user){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		try{
			pm.makePersistent(user);
		}
		finally{
			pm.close();
		}
	}
	public void addEvent(Event event,String org){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		Organizer  user = null;
		Key key = KeyFactory.createKey(Organizer.class.getSimpleName(), org);
			
		try{
			pm.makePersistent(event);
			user = pm.getObjectById(Organizer.class,key);
			user.addEvent(event.getKey());
			
		}
		finally{
			pm.close();
		}
	}
	public void updateEvent(Event event,Long id){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		Event  e = null;
		Key key = KeyFactory.createKey(Event.class.getSimpleName(),id);
		try{
			e = pm.getObjectById(Event.class,key);
			if(e != null){
				e.setCity(event.getCity());
				e.setCost(event.getCost());
				e.setDate(event.getDate());
				e.setDescription(event.getDescription());
				e.setFree(event.isFree());
				e.setName(event.getName());
				e.setPlace(event.getPlace());
				e.setPlus(event.getPlus());
				e.setProvince(event.getProvince());
				e.setSport(event.getSport());
			}
			
		}
		finally{
			pm.close();
		}
	}
	public void removeUser(User user){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		try{
			pm.deletePersistent(user);
		}
		finally{
			pm.close();
		}
	}
	public Competitor getCompetitor(String nick,String pass){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		//String query = "select from "+ Competitor.class)+" where nick=="+nick+" && pass=="+pass;
		Competitor user = null;
		try {
			Query query = pm.newQuery(Competitor.class,"nick=='"+nick+"' && pass=='"+pass+"'");
			//Query query = pm.newQuery(Competitor.class);
			List<Competitor> list = (List<Competitor>) query.execute();
			
			
			if(list.isEmpty()){
				return null;
			}
			else{
				user = list.get(0);
			}
		}
		finally {
	        pm.close();
	    }

		return user;
	}
	public Competitor getCompetitor(String nick){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		Competitor  user = null;
		Key key = KeyFactory.createKey(Competitor.class.getSimpleName(), nick);
		try{
			user = pm.getObjectById(Competitor.class,key);
		}
		catch(Exception e){
			//return null;
		}
		finally{
			pm.close();
		}
		
		return user;
	}
	public Organizer getOrganizer(String nick){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		Organizer  user = null;
		Key key = KeyFactory.createKey(Organizer.class.getSimpleName(), nick);
		try{
			user = pm.getObjectById(Organizer.class,key);
		}
		catch(Exception e){
			//return null;
		}
		finally{
			pm.close();
		}
		
		return user;
	}
	public Organizer getOrganizer(String nick,String pass){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		//String query = "select from "+ Competitor.class)+" where nick=="+nick+" && pass=="+pass;
		Organizer user = null;
		try {
			Query query = pm.newQuery(Organizer.class,"nick=='"+nick+"' && pass=='"+pass+"'");
			//Query query = pm.newQuery(Competitor.class);
			List<Organizer> list = (List<Organizer>) query.execute();
			
			
			if(list.isEmpty()){
				return null;
			}
			else{
				user = list.get(0);
			}
		}
		finally {
	        pm.close();
	    }

		return user;
	}
	public List<Event> getEvents(String name,String province,String sport){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		//String query = "select from "+ Competitor.class)+" where nick=="+nick+" && pass=="+pass;
		List<Event>  events = null;
		String filter = "";
		try {
			Query query = pm.newQuery(Event.class);
			if(name != null){
				filter+= "name == '"+name+"' ";
			}
			if(province != null){
				if(!filter.equals("")){
					filter+=" && ";
				}
				filter+="province == '"+province+"'";
			}
			if(sport != null){
				if(!filter.equals("")){
					filter+=" && ";
				}
				filter+="sport == '"+sport+"'";
			}
			if(!filter.equals(""))
				query.setFilter(filter);
			query.setOrdering("this.date ASC");
			events = (List<Event>) query.execute();
			if(events.isEmpty()){
				return null;
			}
		}
		finally {
	        pm.close();
	    }
		return events;
	}
	public Event getEvent(Long id){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		Event  event = null;
		Key key = KeyFactory.createKey(Event.class.getSimpleName(), id);
		try{
			event = pm.getObjectById(Event.class,key);
		}
		catch(Exception e){
			//return null;
		}
		finally{
			pm.close();
		}
		
		return event;
	}
	
	public void addSignEvent(Long id,String comp){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		Event  event = null;
		Competitor  user = null;
		Key key_event = KeyFactory.createKey(Event.class.getSimpleName(), id);
		Key key_comp = KeyFactory.createKey(Competitor.class.getSimpleName(), comp);
		try{
			event = pm.getObjectById(Event.class,key_event);
			event.addCompetitor(comp);
			
			user = pm.getObjectById(Competitor.class,key_comp);
			user.addEvent(event.getKey());
			
		}
		catch(Exception e){
			//return;
		}
		finally{
			pm.close();
		}
		//return event;
	}
	public void removeSignEvent(Long id,String comp){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		Event  event = null;
		Competitor  user = null;
		Key key_event = KeyFactory.createKey(Event.class.getSimpleName(), id);
		Key key_comp = KeyFactory.createKey(Competitor.class.getSimpleName(), comp);
		try{
			event = pm.getObjectById(Event.class,key_event);
			event.removeCompetitor(comp);
			
			user = pm.getObjectById(Competitor.class,key_comp);
			user.removeEvent(event.getKey());
		}
		catch(Exception e){
			//return;
		}
		finally{
			pm.close();
		}
		//return event;
	}
}
