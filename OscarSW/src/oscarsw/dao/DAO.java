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
	public void removeUser(User user){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		try{
			pm.deletePersistent(user);
		}
		finally{
			pm.close();
		}
	}
	public User getUser(String nick,String pass){
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		//String query = "select from "+ Competitor.class)+" where nick=="+nick+" && pass=="+pass;
		User user = null;
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
}
