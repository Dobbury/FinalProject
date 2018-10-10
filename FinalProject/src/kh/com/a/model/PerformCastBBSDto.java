package kh.com.a.model;

import java.io.Serializable;

public class PerformCastBBSDto implements Serializable {
	
	private int perform_seq;
	private String name;
	private String compname;
	private String email;
	private String phone;
	private String place;
	private int price;
	private int totalcount;
	private int agegrade;
	private String content;
	private int approval;
	public PerformCastBBSDto() {
		super();
	}
	public PerformCastBBSDto(int perform_seq, String name, String compname, String email, String phone, String place,
			int price, int totalcount, int agegrade, String content, int approval) {
		super();
		this.perform_seq = perform_seq;
		this.name = name;
		this.compname = compname;
		this.email = email;
		this.phone = phone;
		this.place = place;
		this.price = price;
		this.totalcount = totalcount;
		this.agegrade = agegrade;
		this.content = content;
		this.approval = approval;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getAgegrade() {
		return agegrade;
	}
	public void setAgegrade(int agegrade) {
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
	@Override
	public String toString() {
		return "Perform_Cast_BBSDto [perform_seq=" + perform_seq + ", name=" + name + ", compname=" + compname
				+ ", email=" + email + ", phone=" + phone + ", place=" + place + ", price=" + price + ", totalcount="
				+ totalcount + ", agegrade=" + agegrade + ", content=" + content + ", approval=" + approval + "]";
	}
	
	
}
