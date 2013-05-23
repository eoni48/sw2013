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
public class Competitor extends User {
	
	@Persistent
	private ArrayList<Long> events;

	public Competitor(String nick, String pass,String name) {
		super(nick, pass,name);
		
		events = new ArrayList<Long>();
	}

	public void addEvent(Long id){
		events.add(id);
	}
	public void removeEvent(Long id){
		events.remove(id);
	}
	public boolean isSign(Long id){
		return events.contains(id);
	}
}
