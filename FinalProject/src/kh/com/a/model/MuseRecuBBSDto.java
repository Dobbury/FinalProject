package kh.com.a.model;

import java.io.Serializable;
import java.sql.Date;

public class MuseRecuBBSDto implements Serializable {
	
	private Date sdate;
	private Date edate;
	private String compname;
	private String place;
	private int totalcount;
	private int agegrage;
	private int muse_recu_seq;
	public MuseRecuBBSDto() {
		super();
	}
	public MuseRecuBBSDto(Date sdate, Date edate, String compname, String place, int totalcount, int agegrage,
			int muse_recu_seq) {
		super();
		this.sdate = sdate;
		this.edate = edate;
		this.compname = compname;
		this.place = place;
		this.totalcount = totalcount;
		this.agegrage = agegrage;
		this.muse_recu_seq = muse_recu_seq;
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
	public String getCompname() {
		return compname;
	}
	public void setCompname(String compname) {
		this.compname = compname;
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
	public int getMuse_recu_seq() {
		return muse_recu_seq;
	}
	public void setMuse_recu_seq(int muse_recu_seq) {
		this.muse_recu_seq = muse_recu_seq;
	}
	@Override
	public String toString() {
		return "MuseRecuBBSDto [sdate=" + sdate + ", edate=" + edate + ", compname=" + compname + ", place=" + place
				+ ", totalcount=" + totalcount + ", agegrage=" + agegrage + ", muse_recu_seq=" + muse_recu_seq + "]";
	}
	
	

}
