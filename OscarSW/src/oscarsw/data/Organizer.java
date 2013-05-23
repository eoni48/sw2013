/**
 * 
 */
package oscarsw.data;

import java.util.ArrayList;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;

/**
 * @author roni
 *
 */
@PersistenceCapable
public class Organizer extends User {
	
	@Persistent
	private String name;

	@Persistent
	private ArrayList<Long> events;
	
	public Organizer(String nick, String pass,String name) {
		super(nick, pass,name);
		this.name = name;
		events = new ArrayList<Long>();
	}
	public void addEvent(Long key){
		events.add(key);
	}
	
}
