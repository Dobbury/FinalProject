package kh.com.a.model;

import java.io.Serializable;
import java.sql.Date;

public class ScheduleBBSDto implements Serializable {
	private Date sdate;
	private Date edate;
	private String location;
	private String place;
	private int count;
	private int price;
	private int schedule_seq;
	public ScheduleBBSDto() {
		super();
	}
	public ScheduleBBSDto(Date sdate, Date edate, String location, String place, int count, int price,
			int schedule_seq) {
		super();
		this.sdate = sdate;
		this.edate = edate;
		this.location = location;
		this.place = place;
		this.count = count;
		this.price = price;
		this.schedule_seq = schedule_seq;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSchedule_seq() {
		return schedule_seq;
	}
	public void setSchedule_seq(int schedule_seq) {
		this.schedule_seq = schedule_seq;
	}
	@Override
	public String toString() {
		return "ScheduleBBSDto [sdate=" + sdate + ", edate=" + edate + ", location=" + location + ", place=" + place
				+ ", count=" + count + ", price=" + price + ", schedule_seq=" + schedule_seq + "]";
	}
	
	
}
