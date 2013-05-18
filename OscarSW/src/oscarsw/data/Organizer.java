/**
 * 
 */
package oscarsw.data;

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
	private String NIF;
	
	public Organizer(String nick, String pass,String name,String NIF) {
		super(nick, pass);
		this.name = name;
		this.NIF = NIF;
	}
}
