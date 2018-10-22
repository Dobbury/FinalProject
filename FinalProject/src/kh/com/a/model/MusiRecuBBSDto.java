package kh.com.a.model;

import java.io.Serializable;
import java.sql.Date;

public class MusiRecuBBSDto implements Serializable {

	private Date sdate;
	private Date edate;
	private Date perform_date;
	private String compname;
	private String location;
	private String place;
	private int totalcount;
	private int agegrage;
	private int musi_recu_seq;

	public MusiRecuBBSDto() {
		super();
	}

	public MusiRecuBBSDto(Date sdate, Date edate, Date perform_date, String compname, String location, String place,
			int totalcount, int agegrage, int musi_recu_seq) {
		super();
		this.sdate = sdate;
		this.edate = edate;
		this.perform_date = perform_date;
		this.compname = compname;
		this.location = location;
		this.place = place;
		this.totalcount = totalcount;
		this.agegrage = agegrage;
		this.musi_recu_seq = musi_recu_seq;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public Date getPerform_date() {
		return perform_date;
	}

	public void setPerform_date(Date perform_date) {
		this.perform_date = perform_date;
	}

	public String getCompname() {
		return compname;
	}

	public void setCompname(String compname) {
		this.compname = compname;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public int getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}

	public int getAgegrage() {
		return agegrage;
	}

	public void setAgegrage(int agegrage) {
		this.agegrage = agegrage;
	}

	public int getMusi_recu_seq() {
		return musi_recu_seq;
	}

	public void setMusi_recu_seq(int musi_recu_seq) {
		this.musi_recu_seq = musi_recu_seq;
	}

	@Override
	public String toString() {
		return "MusiRecuBBSDto [sdate=" + sdate + ", edate=" + edate + ", perform_date=" + perform_date + ", compname="
				+ compname + ", location=" + location + ", place=" + place + ", totalcount=" + totalcount
				+ ", agegrage=" + agegrage + ", musi_recu_seq=" + musi_recu_seq + "]";
	}

	
	
	
}
