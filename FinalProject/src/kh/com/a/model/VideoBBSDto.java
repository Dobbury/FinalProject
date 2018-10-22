package kh.com.a.model;

import java.io.Serializable;

public class VideoBBSDto implements Serializable{

	private String id;
	private String title;
	private String content;
	private String video;
	private String wdate;
	private int readcount;
	private String genre;
	private int video_seq;
	
	public VideoBBSDto() {
		super();
	}

	public VideoBBSDto(String id, String title, String content, String video, String wdate, int readcount, String genre,
			int video_seq) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.video = video;
		this.wdate = wdate;
		this.readcount = readcount;
		this.genre = genre;
		this.video_seq = video_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getVideo_seq() {
		return video_seq;
	}

	public void setVideo_seq(int video_seq) {
		this.video_seq = video_seq;
	}

	@Override
	public String toString() {
		return "VideoBBSDto [id=" + id + ", title=" + title + ", content=" + content + ", video=" + video + ", wdate="
				+ wdate + ", readcount=" + readcount + ", genre=" + genre + ", video_seq=" + video_seq + "]";
	}

	
	
	
}
