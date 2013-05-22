/**
 * 
 */
package oscarsw.data;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

/**
 * @author roni
 *
 */

@PersistenceCapable
public class Event {
	
	public enum Sport{athletics,footbal,basket,other}

	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long key;
	
	@Persistent
	private String name;
	@Persistent
	private String organizer;
	@Persistent
	private String city;
	@Persistent
	private String province;
	@Persistent
	private String place;
	@Persistent
	private Sport sport;
	@Persistent
	private Date date;
	@Persistent
	private boolean free;
	@Persistent
	private float cost;
	
	@Persistent
	private String description;
	@Persistent
	private String plus;
	
	@Persistent
	private ArrayList<String> competitors;
	
	public Event(String name,String organizer,String city,String province,String place,Date date,
			boolean free,float cost,String description,String plus,Sport sport){
		
		this.name = name;
		this.organizer = organizer;
		this.city = city;
		this.province = province;
		this.place = place;
		this.date = date;
		this.free = free;
		this.cost = cost;
		this.description = description;
		this.plus = plus;
		this.sport = sport;
		competitors = new ArrayList<String>();
	}

	/**
	 * @return the key
	 */
	public Long getKey() {
		return key;
	}

	/**
	 * @return the organizer
	 */
	public String getOrganizer() {
		return organizer;
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
	public Date getDate() {
		return date;
		
	}
	public String dateToString(){
		return new SimpleDateFormat("dd/MM/yy").format(date);
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(Date date) {
		this.date = date;
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
	 * @return the sport
	 */
	public Sport getSport() {
		return sport;
	}

	/**
	 * @param sport the sport to set
	 */
	public void setSport(Sport sport) {
		this.sport = sport;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the competitors
	 */
	public ArrayList<String> getCompetitors() {
		return competitors;
	}
	public void addCompetitor(String comp){
		competitors.add(comp);
	}
	public void removeCompetitor(String comp){
		competitors.remove(comp);
	}
	public boolean isSign(String comp){
		return competitors.contains(comp);
	}
	public int getNumCompetitor(){
		return competitors.size();
	}
	public String provinceToString(){
		String string = "";
		if(province.equals("andalucia")){
			string =  "Anadalucia";
		}
		else if(province.equals("aragon")){
			string =  "Aragón";
		}
		else if(province.equals("asturias")){
			string =  "Asturias";
		}
		else if(province.equals("baleares")){
			string =  "Anadalucia";
		}
		else if(province.equals("canarias")){
			string =  "Islas Baleares";
		}
		else if(province.equals("cantabria")){
			string =  "Cantabria";
		}
		else if(province.equals("castilla_mancha")){
			string =  "Castilla la Mancha";
		}
		else if(province.equals("castilla_leon")){
			string =  "Castilla y León";
		}
		else if(province.equals("catalona")){
			string =  "Anadalucia";
		}
		else if(province.equals("extremadura")){
			string =  "Extremadura";
		}
		else if(province.equals("galicia")){
			string =  "Galicia";
		}
		else if(province.equals("rioja")){
			string =  "La Rioja";
		}
		else if(province.equals("madrid")){
			string =  "Comunidad de Madrid";
		}
		else if(province.equals("murcia")){
			string =  "Murcia";
		}
		else if(province.equals("navarra")){
			string =  "Navarra";
		}
		else if(province.equals("vasco")){
			string =  "País Vasco";
		}
		else if(province.equals("valencia")){
			string =  "Comunidad Valenciana";
		}
		return string;
	}
}
