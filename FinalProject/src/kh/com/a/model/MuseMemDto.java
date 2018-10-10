package kh.com.a.model;

import java.io.Serializable;

public class MuseMemDto implements Serializable {
	private String id;
	private String pwd;
	private String name;
	private String profilIMG;
	private String genre;
	private String location;
	private String position;
	private int right;//권한
	private int muse_seq;
	public MuseMemDto() {
		super();
	}
	public MuseMemDto(String id, String pwd, String name, String profilIMG, String genre, String location,
			String position, int right, int muse_seq) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.profilIMG = profilIMG;
		this.genre = genre;
		this.location = location;
		this.position = position;
		this.right = right;
		this.muse_seq = muse_seq;
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
	public String getProfilIMG() {
		return profilIMG;
	}
	public void setProfilIMG(String profilIMG) {
		this.profilIMG = profilIMG;
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
	public int getMuse_seq() {
		return muse_seq;
	}
	public void setMuse_seq(int muse_seq) {
		this.muse_seq = muse_seq;
	}
	@Override
	public String toString() {
		return "MusiMemDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", profilIMG=" + profilIMG + ", genre="
				+ genre + ", location=" + location + ", position=" + position + ", right=" + right + ", muse_seq="
				+ muse_seq + "]";
	}
	
	
}
