package beans;

import java.io.Serializable;
import java.lang.String;
import java.util.Set;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: Korisnik
 *
 */
@Entity
@Table(name="Korisnik")
public class User implements Serializable {

	@Id
	@GeneratedValue
	private int idUser;
	private String userName;
	private String UserPassword;
	private String name;
	private String surname;
	private String email;
	private String role;
	private static final long serialVersionUID = 1L;
	
	
	@ManyToMany
	@JoinTable(name="UserStamp",
	joinColumns=@JoinColumn(name="userId", referencedColumnName="idUser"), 
	inverseJoinColumns=@JoinColumn(name="stampId", referencedColumnName="idStamp"))
	private Set<Stamp> stamps;
	
	

	public User() {
		super();
	}   
	public int getIdUser() {
		return this.idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}   
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}   
	public String getUserPassword() {
		return this.UserPassword;
	}

	public void setUserPassword(String UserPassword) {
		this.UserPassword = UserPassword;
	}   
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}   
	public String getSurname() {
		return this.surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}   
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}   
	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	//vise prema vise za tabelu Stamp
		public Set<Stamp> getStamps() {
			return stamps;
		}
		public void setStamp(Set<Stamp> stamps) {
			this.stamps = stamps;
		}
   
}
