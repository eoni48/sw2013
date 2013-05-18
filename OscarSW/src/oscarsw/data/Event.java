/**
 * 
 */
package oscarsw.data;

import java.util.ArrayList;

/**
 * @author roni
 *
 */
enum Type{pop,land}
public class Event {
	private Organizer creator;
	
	private String name;
	private String organizer;
	private String city;
	private String province;
	private String place;
	private String date;
	private Type type;
	private boolean free;
	private float cost;
	
	private String description;
	private String plus;
	
	private ArrayList<Competitor> competitors;
	
	public Event(Organizer creator,String name,String organizer,String city,String province,String place,String date,Type type,
			boolean free,float cost,String description,String plus){
		
		this.creator = creator;
		this.name = name;
		this.organizer = organizer;
		this.city = city;
		this.province = province;
		this.place = place;
		this.date = date;
		this.type = type;
		this.free = free;
		this.cost = cost;
		this.description = description;
		this.plus = plus;
		
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * @return the province
	 */
	public String getProvince() {
		return province;
	}

	/**
	 * @param province the province to set
	 */
	public void setProvince(String province) {
		this.province = province;
	}

	/**
	 * @return the place
	 */
	public String getPlace() {
		return place;
	}

	/**
	 * @param place the place to set
	 */
	public void setPlace(String place) {
		this.place = place;
	}

	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}

	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}

	/**
	 * @return the type
	 */
	public Type getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(Type type) {
		this.type = type;
	}

	/**
	 * @return the free
	 */
	public boolean isFree() {
		return free;
	}

	/**
	 * @param free the free to set
	 */
	public void setFree(boolean free) {
		this.free = free;
	}

	/**
	 * @return the cost
	 */
	public float getCost() {
		return cost;
	}

	/**
	 * @param cost the cost to set
	 */
	public void setCost(float cost) {
		this.cost = cost;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the plus
	 */
	public String getPlus() {
		return plus;
	}

	/**
	 * @param plus the plus to set
	 */
	public void setPlus(String plus) {
		this.plus = plus;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @return the competitors
	 */
	public ArrayList<Competitor> getCompetitors() {
		return competitors;
	}
}
