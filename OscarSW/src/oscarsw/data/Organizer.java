/**
 * 
 */
package oscarsw.data;

import java.util.ArrayList;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;

import com.google.appengine.api.datastore.Key;

/**
 * @author roni
 *
 */
@PersistenceCapable
public class Organizer extends User {
	
	@Persistent
	private String name;
	@Persistent
	private String NIF;
	@Persistent
	private ArrayList<Long> events;
	
	public Organizer(String nick, String pass,String name,String NIF) {
		super(nick, pass);
		this.name = name;
		this.NIF = NIF;
		events = new ArrayList<Long>();
	}
	public void addEvent(Long key){
		events.add(key);
	}
	
}
