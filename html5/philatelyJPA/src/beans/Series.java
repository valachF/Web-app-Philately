package beans;

import java.io.Serializable;
import java.lang.String;
import java.util.Set;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: Series
 *
 */
@Entity
@Table(name="Series")
public class Series implements Serializable {

	@Id    
	private String idSeries;
	private String seriesDescription;
	private String printOffice;
	private static final long serialVersionUID = 1L;
	@OneToMany(fetch=FetchType.EAGER,mappedBy="serija")
	private Set<Stamp> stamps;

	public Series() {
		super();
	}   
	
	public String getIdSeries() {
		return this.idSeries;
	}

	public void setIdSeries(String idSeries) {
		this.idSeries = idSeries;
	}   
	public String getSeriesDescription() {
		return this.seriesDescription;
	}

	public void setSeriesDescription(String seriesDescription) {
		this.seriesDescription = seriesDescription;
	}
	public String getPrintOffice() {
		return this.printOffice;
	}

	public void setPrintOffice(String printOffice) {
		this.printOffice = printOffice;
	}   
	//jedan prema vise
	public Set<Stamp> getStamps() {
		return stamps;
	}
	public void setStamps(Set<Stamp> stamps) {
		this.stamps = stamps;
	}
}
