package kh.com.a.model;

import java.io.Serializable;
import java.sql.Date;

public class MemDto implements Serializable {
	private String id;
	private String pwd;
	private String name;
	private String pjone;
	private String email;
	private String genre;
	private String location;
	private Date birth;
	private String gender;
	private int mem_seq;
	
	public MemDto() {
		super();
	}

	public MemDto(String id, String pwd, String name, String pjone, String email, String genre, String location,
			Date birth, String gender, int mem_seq) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.pjone = pjone;
		this.email = email;
		this.genre = genre;
		this.location = location;
		this.birth = birth;
		this.gender = gender;
		this.mem_seq = mem_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPjone() {
		return pjone;
	}

	public void setPjone(String pjone) {
		this.pjone = pjone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", pjone=" + pjone + ", email=" + email
				+ ", genre=" + genre + ", location=" + location + ", birth=" + birth + ", gender=" + gender
				+ ", mem_seq=" + mem_seq + "]";
	}
	
	
}
