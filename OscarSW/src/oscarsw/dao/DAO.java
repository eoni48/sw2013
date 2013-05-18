/**
 * 
 */
package oscarsw.dao;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;

import org.datanucleus.jpa.Persistable;

import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.search.ExpressionParser.num_return;

import oscarsw.data.User;

/**
 * @author roni
 *
 */
public class DAO {
	private static DAO singleton;
	 private static final PersistenceManagerFactory pmfInstance =
		        JDOHelper.getPersistenceManagerFactory("transactions-optional");

	
	private DAO(){
		
	}
	public static DAO getInstance(){
		if(singleton == null){
			singleton = new DAO();
		}
		return singleton;
	}
	public void addUser(User user){
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
		//String query = "select from "+ User.class.getName()+" WHERE "
		User user;
		try {

			user = pm.getObjectById(User.class,nick);
			if(user != null){
				if(!user.getPass().equals(pass)){
					user = null;
				}
			}
		}
		finally {
	        pm.close();
	    }

		return user;
	}
}
