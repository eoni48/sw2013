/**
 * 
 */
package oscarsw.dao;

import java.util.List;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;
import javax.jdo.Query;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import oscarsw.data.Competitor;
import oscarsw.data.Event;
import oscarsw.data.Organizer;
import oscarsw.data.User;

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
	public void addEvent(Event event){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		try{
			pm.makePersistent(event);
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
	public List<Event> getEvents(){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		//String query = "select from "+ Competitor.class)+" where nick=="+nick+" && pass=="+pass;
		List<Event>  events = null;
		try {
			Query query = pm.newQuery(Event.class);
			query.setOrdering("date asc");
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
			return null;
		}
		finally{
			pm.close();
		}
		
		return event;
	}
	
	public Event addSignEvent(Long id,String comp){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		Event  event = null;
		Key key = KeyFactory.createKey(Event.class.getSimpleName(), id);
		try{
			event = pm.getObjectById(Event.class,key);
			event.addCompetitor(comp);
		}
		catch(Exception e){
			return null;
		}
		finally{
			pm.close();
		}
		return event;
	}
}
