package philatelyejb;

import java.sql.Blob;
import java.util.List;

import javax.ejb.Remote;

import beans.Stamp;
import beans.Series;
import beans.User;

@Remote
public interface PhilatelySessionRemote {
	 
	 //Korisnik
	 public boolean addUserAdmin(String userName, String UserPassword, String name, String surname, String email);
	 public boolean addUserCustomer(String userName, String UserPassword, String name, String surname, String email);
	 public List<User> getAllUsers();
	 public User getUserbyUname(String username);
	 public User getUser(int idUser);
	 public boolean deleteUser(int idUser);
	 public boolean updateUserA(int idUser,String userName, String UserPassword, String name, String surname, String email);
	 public boolean updateUserC(int idUser,String userName, String UserPassword, String name, String surname, String email);
	 
	 //Serija
	 public boolean addSeries(String idSeries, String seriesDescription, String printOffice);
	 public boolean updateSeries(String idSeries, String seriesDescription, String printOffice);
	 public boolean deleteSeries(String idSeries);
	 public Series getSeries(String idSeries);
	 public Series getSeriesbyDecs(String seriesDescription);
	 public List<Series> getAllSeries();
	 
	 //Marka
	 public boolean addStamp(int idCatalog, String stampDesription, double nominalValue,double value,String country,
	    		String author,String color,String perforation,int year,int circulation,Blob photo,String status, String idSeries);
	 public boolean updateStamp(int idStamp,int idCatalog, String stampDesription, double nominalValue,double value,String country,
	    		String author,String color,String perforation,int year,int circulation,Blob photo,String status, String idSeries);
	 public boolean deleteStamp(int idStamp);
	 public Stamp getStamp(int idStamp);
	 public List<Stamp> getAllStamps();
	 public Stamp getStampbyDecs(String stampDesription);
	 public int addStamp2(int idCatalog, String stampDesription, double nominalValue,double value,String country,
		    	String author,String color,String perforation,int year,int circulation,Blob photo,String status, String idSeries);
	 
	 //metode
	 public List<Stamp> getStampsofUser(int idUser);
	 public boolean addUserStamp(int idStamp, int idUser);
	 public User loginIn(String userName, String userPassword);
	 public List<Stamp> getStampsByStatus(String status);
	 public List<Stamp> getStampsByCatId(int idCatalog);
	 public User getOwnerOfStamp(int stampId);
	 public User getOwnerOfStamp2(int stampId);

	
}
