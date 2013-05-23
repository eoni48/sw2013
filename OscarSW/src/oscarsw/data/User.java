/**
 * 
 */
package oscarsw.data;

import javax.jdo.annotations.Inheritance;
import javax.jdo.annotations.InheritanceStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

/**
 * @author roni
 *
 */
@PersistenceCapable
@Inheritance(strategy = InheritanceStrategy.SUBCLASS_TABLE)
public class User {
	@PrimaryKey
	private String nick;
	@Persistent
	private String pass;
	@Persistent
	private String name;
	
	
	public User(String nick,String pass,String name){
		this.nick = nick;
		this.pass = pass;
		this.name = name;
	}
	/**
	 * @return the nick
	 */
	public String getNick() {
		return nick;
	}
	/**
	 * @return the pass
	 */
	public String getPass() {
		return pass;
	}
	/**
	 * @param pass the pass to set
	 */
	public void setPass(String pass) {
		this.pass = pass;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	
}
