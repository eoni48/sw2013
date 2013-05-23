/**
 * 
 */
package oscarsw.data;

import java.util.ArrayList;

import javax.jdo.annotations.PersistenceCapable;

/**
 * @author roni
 *
 */
@PersistenceCapable
public class Competitor extends User {
	

	public Competitor(String nick, String pass,String name) {
		super(nick, pass,name);
		
		events = new ArrayList<Long>();
	}
	public boolean isSign(Long id){
		return  events.contains(id);
	}
	
	
}
