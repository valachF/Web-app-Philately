package philatelyejb;

import java.sql.Blob;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ejb.Stateless;


import beans.Stamp;
import beans.User;
import beans.Series;
/**
 * Session Bean implementation class PhilatelySession
 */
@Stateless
public class PhilatelySession implements PhilatelySessionLocal,
										PhilatelySessionRemote{

	@PersistenceContext
	protected EntityManager em;
    /**
     * Default constructor. 
     */
    public PhilatelySession() {
        // TODO Auto-generated constructor stub
    }
    
    //Korisnik
    
    public boolean addUserAdmin(String userName, String UserPassword, String name, String surname, String email){
    	User user=new User();
    	user.setUserName(userName);
    	user.setUserPassword(UserPassword);
    	user.setName(name);
    	user.setSurname(surname);
    	user.setEmail(email);
    	user.setRole("Administrator");
    	if(user!=null){
    		em.persist(user);
    	} return true; 	
    }
    
    public boolean addUserCustomer(String userName, String UserPassword, String name, String surname, String email){
    	User user=new User();
    	user.setUserName(userName);
    	user.setUserPassword(UserPassword);
    	user.setName(name);
    	user.setSurname(surname);
    	user.setEmail(email);
    	user.setRole("Korisnik");
    	if(user!=null){
    		em.persist(user);
    	} return true; 	
    }
    
    public List<User> getAllUsers(){
    	List<User> userList=em.createQuery("select u from User u").getResultList();
    	return userList;
    }
    
    public User getUserbyUname(String username){    	
    	return (User)em.createQuery("select u from User u where u.userName=:uname").setParameter("uname", username).getSingleResult();
    }
    
    public User getUser(int idUser){
    	User u=em.find(User.class, idUser);
    	return u;
    }
    
    public boolean deleteUser(int idUser){
    	User u=em.find(User.class, idUser);
    			try{
    				em.merge(u);
    				em.remove(u);
    				em.flush();
    				return true;
    			}catch(Exception ex){
    				ex.printStackTrace();
    				return false;
    			}
    }
    
    public boolean updateUserA(int idUser,String userName, String UserPassword, String name, String surname, String email){
    	try{
    	User user=new User();
    	user.setIdUser(idUser);
    	user.setUserName(userName);
    	user.setUserPassword(UserPassword);
    	user.setName(name);
    	user.setSurname(surname);
    	user.setEmail(email);
    	user.setRole("Administrator");
    	em.merge(user);
    	return true;
    	}catch(Exception e){
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public boolean updateUserC(int idUser,String userName, String UserPassword, String name, String surname, String email){
    	try{
    	User user=new User();
    	user.setIdUser(idUser);
    	user.setUserName(userName);
    	user.setUserPassword(UserPassword);
    	user.setName(name);
    	user.setSurname(surname);
    	user.setEmail(email);
    	user.setRole("Korisnik");
    	em.merge(user);
    	return true;
    	}catch(Exception e){
    		e.printStackTrace();
    		return false;
    	}
    }
    
    
    //Serija
    
    public boolean addSeries(String idSeries, String seriesDescription, String printOffice){
    	try{
    	Series series=new Series();
    	series.setIdSeries(idSeries);
    	series.setSeriesDescription(seriesDescription);
    	series.setPrintOffice(printOffice);
    	em.persist(series);
    	return true;
    	}catch(Exception e){
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public boolean updateSeries(String idSeries, String seriesDescription, String printOffice){
    	try{
    		Series s=new Series();
    		s.setIdSeries(idSeries);
    		s.setSeriesDescription(seriesDescription);
    		s.setPrintOffice(printOffice);
    		em.merge(s);
    		return true;
    	}catch(Exception e ){
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public boolean deleteSeries(String idSeries){
    	Series series=em.find(Series.class, idSeries);
    	try{
    		em.merge(series);
    		em.remove(series);
    		em.flush();
    		return true;
    	}catch(Exception e){
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public Series getSeries(String idSeries){
    	Series s=em.find(Series.class, idSeries);	
    	return s;  				
    }
    
    public Series getSeriesbyDecs(String seriesDescription){    	
    	return (Series)em.createQuery("select s from Series s where s.seriesDescription=:seriesDescription").setParameter("seriesDescription", seriesDescription).getSingleResult();
    }
    
    public List<Series> getAllSeries(){
    	List<Series> seriesList=em.createQuery("select s from Series s").getResultList();
    	return seriesList;
    }
    
    //Marka
    public boolean addStamp(int idCatalog, String stampDesription, double nominalValue,double value,String country,
    		String author,String color,String perforation,int year,int circulation,Blob photo,String status, String idSeries){
    	try{
    		Stamp s=new Stamp();
    		s.setIdCatalog(idCatalog);
    		s.setStampDesription(stampDesription);
    		s.setNominalValue(nominalValue);
    		s.setValue(value);
    		s.setCountry(country);
    		s.setAuthor(author);
    		s.setColor(color);
    		s.setPerforation(perforation);
    		s.setYear(year);
    		s.setCirculation(circulation);
    		s.setPhoto(photo);
    		s.setStatus(status);
    		Series series=em.find(Series.class, idSeries);
    		s.setSeries(series);
    		em.persist(s);
    		return true;
    	}catch(Exception e){
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public boolean updateStamp(int idStamp,int idCatalog, String stampDesription, double nominalValue,double value,String country,
    		String author,String color,String perforation,int year,int circulation,Blob photo,String status, String idSeries){
    	try{
    		Stamp s=new Stamp();
    		s.setIdStamp(idStamp);
    		s.setIdCatalog(idCatalog);
    		s.setStampDesription(stampDesription);
    		s.setNominalValue(nominalValue);
    		s.setValue(value);
    		s.setCountry(country);
    		s.setAuthor(author);
    		s.setColor(color);
    		s.setPerforation(perforation);
    		s.setYear(year);
    		s.setCirculation(circulation);
    		s.setPhoto(photo);
    		s.setStatus(status);
    		Series series=em.find(Series.class, idSeries);
    		s.setSeries(series);
    		em.merge(s);
    		return true;
    	}catch(Exception e){
    		e.printStackTrace();
    		return false;
    	}
    	
    }
    
    public boolean deleteStamp(int idStamp){
    	Stamp stamp=em.find(Stamp.class,idStamp);
    	try{
    		em.merge(stamp);
    		em.remove(stamp);
    		em.flush();
    		return true; 
    	}catch(Exception e){
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public Stamp getStamp(int idStamp){
    	Stamp s=em.find(Stamp.class, idStamp);
    	return s;
    }
    public List<Stamp> getAllStamps(){
    	List<Stamp> stampsList=em.createQuery("select s from Stamp s").getResultList();
    	return stampsList;
    }
    public Stamp getStampbyDecs(String stampDesription){    	
    	return (Stamp)em.createQuery("select s from Stamp s where s.stampDesription=:stampDesription").setParameter("stampDesription", stampDesription).getSingleResult();
    }
    
    public int addStamp2(int idCatalog, String stampDesription, double nominalValue,double value,String country,
    		String author,String color,String perforation,int year,int circulation,Blob photo,String status, String idSeries){
    	try{
    		Stamp s=new Stamp();
    		s.setIdCatalog(idCatalog);
    		s.setStampDesription(stampDesription);
    		s.setNominalValue(nominalValue);
    		s.setValue(value);
    		s.setCountry(country);
    		s.setAuthor(author);
    		s.setColor(color);
    		s.setPerforation(perforation);
    		s.setYear(year);
    		s.setCirculation(circulation);
    		s.setPhoto(photo);
    		s.setStatus(status);
    		System.out.println("ID serije u phEJBje:= "+ idSeries);
    		Series series=em.find(Series.class, idSeries);
    		s.setSeries(series);
    		    		
    		em.persist(s);
    		return s.getIdStamp();
    	}catch(Exception e){
    		e.printStackTrace();
    		return 0;
    	}
    }
    
    //metode
    
    public List<Stamp> getStampsofUser(int idUser){
    	List<Stamp> stampList=em.createQuery("select s from Stamp s join s.users u where u.idUser=:idUser")
		.setParameter("idUser", idUser).getResultList();
    	return stampList;
    }
    
    public boolean addUserStamp(int idStamp, int idUser){
    	try{
    		Stamp stamp=getStamp(idStamp);
    		User user=getUser(idUser);
    		stamp.getUsers().add(user);
    		user.getStamps().add(stamp);
    		em.persist(stamp);
    	  //em.persist(user);
    		
    		return true;
    	}catch(Exception e){
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public User loginIn(String userName, String UserPassword){
    	User user=(User)em.createQuery("select u from User u where u.userName=:userName and u.UserPassword=:UserPassword").setParameter("userName", userName).setParameter("UserPassword", UserPassword).getSingleResult();
    	if(user != null){
    		return user;
    	}else{
    		return null;
    	}
    }
    
    public List<Stamp> getStampsByStatus(String status){
    	List<Stamp> stampList=em.createQuery("select s from Stamp s where s.status=:status")
    			.setParameter("status", status).getResultList();
    	return stampList;
    }
    public List<Stamp> getStampsByCatId(int idCatalog){
    	List<Stamp> stampList=em.createQuery("select s from Stamp s where s.idCatalog=:idCatalog")
    			.setParameter("idCatalog", idCatalog).getResultList();
    	return stampList;
    }
    public User getOwnerOfStamp(int idStamp){
//    	List<Stamp> stampList=em.createQuery("select us from UserStamp us where us.userId=:userId")
//    			.setParameter("userId", userId).getResultList();
//    	return stampList;
    	User user=(User)em.createQuery("select us from UserStamp us where us.idStamp=:idStamp")
		.setParameter("idStamp", idStamp).getSingleResult();
    	return user;
    }
    public User getOwnerOfStamp2(int idStamp){
//    	List<Stamp> stampList=em.createQuery("select us from UserStamp us where us.userId=:userId")
//    			.setParameter("userId", userId).getResultList();
//    	return stampList;
    	User user=(User)em.createQuery("select u from User u join u.stamps s where s.idStamp=:idStamp")
		.setParameter("idStamp", idStamp).getSingleResult();
    	return user;
    }
    
}
