/**
 * 
 */
package oscarsw.data;

import javax.jdo.annotations.PersistenceCapable;

/**
 * @author roni
 *
 */
@PersistenceCapable
public class Organizer extends User {
	


	
	
	public Organizer(String nick, String pass,String name) {
		super(nick, pass,name);
	}
	
	
}
