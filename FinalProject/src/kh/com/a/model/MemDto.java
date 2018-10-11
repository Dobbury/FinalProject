package kh.com.a.model;

import java.io.Serializable;
import java.sql.Date;

public class MemDto implements Serializable {
	
	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private String genre;
	private String location;
	private int birth;
	private String teamname;
	private String profilIMG;
	private String position;
	private int right;
	private int auth;
	private int online_check;
	private String gender;
	private int mem_seq;
	
	public MemDto() {
		super();
	}

	//일반 회원
	public MemDto(String id, String pwd, String name, String phone, String email, String genre, String location,
			int birth, int auth, int online_check, String gender, int mem_seq) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.genre = genre;
		this.location = location;
		this.birth = birth;
		this.auth = auth;
		this.online_check = online_check;
		this.gender = gender;
		this.mem_seq = mem_seq;
	}

	//뮤지션
	public MemDto(String teamname, String id, String pwd, String name, String phone, String email, String genre, String location,
			int birth, String profilIMG, String position, int right, int auth, int online_check,
			String gender, int mem_seq) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.genre = genre;
		this.location = location;
		this.birth = birth;
		this.teamname = teamname;
		this.profilIMG = profilIMG;
		this.position = position;
		this.right = right;
		this.auth = auth;
		this.online_check = online_check;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}

	public String getTeamname() {
		return teamname;
	}

	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}

	public String getProfilIMG() {
		return profilIMG;
	}

	public void setProfilIMG(String profilIMG) {
		this.profilIMG = profilIMG;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getRight() {
		return right;
	}

	public void setRight(int right) {
		this.right = right;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public int getOnline_check() {
		return online_check;
	}

	public void setOnline_check(int online_check) {
		this.online_check = online_check;
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
		return "MemDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", phone=" + phone + ", email=" + email
				+ ", genre=" + genre + ", location=" + location + ", birth=" + birth + ", teamname=" + teamname
				+ ", profilIMG=" + profilIMG + ", position=" + position + ", right=" + right + ", auth=" + auth
				+ ", online_check=" + online_check + ", gender=" + gender + ", mem_seq=" + mem_seq + "]";
	}
	
	
}
