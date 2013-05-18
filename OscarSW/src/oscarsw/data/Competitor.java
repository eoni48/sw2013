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
public class Competitor extends User {
	
	@Persistent
	private String name;
	@Persistent
	private String lastName;
	@Persistent
	private String dni;
	
	public Competitor(String nick, String pass,String name,String lastName,String dni) {
		super(nick, pass);
		this.name = name;
		this.lastName = lastName;
		this.dni = dni;
	}
	
}
