package kh.com.a.model;

import java.io.Serializable;

public class PerformCastBBSDto implements Serializable {
	
	private int perform_seq;
	private String name;
	private String compname;
	private String email;
	private String phone;
	private String place;
	private String price;
	private String location;
	private int totalcount;
	private String agegrade;
	private String content;
	private int approval;
	private String wdate;
	
	public PerformCastBBSDto() {
		super();
	}
	
	/*
	public PerformCastBBSDto(String name, String compname, String email, String phone, String place,
			String price, String location, int totalcount, String content, int approval) {
		super();
		this.name = name;
		this.compname = compname;
		this.email = email;
		this.phone = phone;
		this.place = place;
		this.price = price;
		this.location = location;
		this.totalcount = totalcount;
		this.content = content;
		this.approval = approval;
	}*/


	public PerformCastBBSDto(int perform_seq, String name, String compname, String email, String phone, String place,
			String price, String location, int totalcount, String agegrade, String content, int approval, String wdate) {
		super();
		this.perform_seq = perform_seq;
		this.name = name;
		this.compname = compname;
		this.email = email;
		this.phone = phone;
		this.place = place;
		this.price = price;
		this.location = location;
		this.totalcount = totalcount;
		this.agegrade = agegrade;
		this.content = content;
		this.approval = approval;
		this.wdate = wdate;
	}
	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getPerform_seq() {
		return perform_seq;
	}
	public void setPerform_seq(int perform_seq) {
		this.perform_seq = perform_seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompname() {
		return compname;
	}
	public void setCompname(String compname) {
		this.compname = compname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public String getAgegrade() {
		return agegrade;
	}
	public void setAgegrade(String agegrade) {
		this.agegrade = agegrade;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getApproval() {
		return approval;
	}
	public void setApproval(int approval) {
		this.approval = approval;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "PerformCastBBSDto [perform_seq=" + perform_seq + ", name=" + name + ", compname=" + compname
				+ ", email=" + email + ", phone=" + phone + ", place=" + place + ", price=" + price + ", location="
				+ location + ", totalcount=" + totalcount + ", agegrade=" + agegrade + ", content=" + content
				+ ", approval=" + approval + ", wdate=" + wdate + "]";
	}
	

	
}
