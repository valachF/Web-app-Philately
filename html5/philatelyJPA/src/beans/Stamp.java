package beans;

import java.io.Serializable;
import java.lang.String;
import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: Stamp
 *
 */
@Entity
@Table(name="Stamp")
public class Stamp implements Serializable {

	@Id   
	@GeneratedValue
	private int idStamp;
	private int idCatalog;
	private String stampDesription;
	private double nominalValue;
	private double value;
	private String country;
	private String author;	
	private String color;
	private String perforation;
	private int year;
	private int circulation;
	private Blob photo;
	private String status;
	private static final long serialVersionUID = 1L;
	
	@ManyToMany(fetch=FetchType.EAGER,mappedBy="stamps")
	private Set<User> users;
	
	@ManyToOne
	@JoinColumn(name="serija_id")
	protected Series serija;


	public Stamp() {
		super();
	}   
	 
	public int getIdStamp() {
		return this.idStamp;
	}

	public void setIdStamp(int idStamp) {
		this.idStamp = idStamp;
	}   
	public int getIdCatalog() {
		return this.idCatalog;
	}

	public void setIdCatalog(int idCatalog) {
		this.idCatalog = idCatalog;
	}   
	public String getStampDesription() {
		return this.stampDesription;
	}

	public void setStampDesription(String stampDesription) {
		this.stampDesription = stampDesription;
	}   
	public double getNominalValue() {
		return this.nominalValue;
	}

	public void setNominalValue(double nominalValue) {
		this.nominalValue = nominalValue;
	}   
	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}   
	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}   
	public String getColor() {
		return this.color;
	}

	public void setColor(String color) {
		this.color = color;
	}   
	public String getPerforation() {
		return this.perforation;
	}

	public void setPerforation(String perforation) {
		this.perforation = perforation;
	}   
	public int getYear() {
		return this.year;
	}

	public void setYear(int year) {
		this.year = year;
	}   
	public int getCirculation() {
		return this.circulation;
	}

	public void setCirculation(int circulation) {
		this.circulation = circulation;
	}   
	public Blob getPhoto() {
		return this.photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}   
	public double getValue() {
		return this.value;
	}

	public void setValue(double value) {
		this.value = value;
	}   
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	//vise prema jedan za tabelu Series
	public Series getSeries() {
		return serija;
	}
	public void setSeries(Series serija) {
		this.serija = serija;
	}
	
	//vise prema vise za tabelu User	
	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}
	
	public void addUser(User user){
		if (users == null){
			users = new HashSet<User>();
		}
		users.add(user);
	}
   
}
