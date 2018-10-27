package kh.com.a.model;

import java.io.Serializable;

public class RecuMusiInfoDto implements Serializable {

	private int recu_musi_info_seq;
	private String musiid;
	private int musi_recu_seq;
	public RecuMusiInfoDto() {
		super();
	}
	public RecuMusiInfoDto(int recu_musi_info_seq, String musiid, int musi_recu_seq) {
		super();
		this.recu_musi_info_seq = recu_musi_info_seq;
		this.musiid = musiid;
		this.musi_recu_seq = musi_recu_seq;
	}
	public int getRecu_musi_info_seq() {
		return recu_musi_info_seq;
	}
	public void setRecu_musi_info_seq(int recu_musi_info_seq) {
		this.recu_musi_info_seq = recu_musi_info_seq;
	}
	public String getMusiid() {
		return musiid;
	}
	public void setMusiid(String musiid) {
		this.musiid = musiid;
	}
	public int getMusi_recu_seq() {
		return musi_recu_seq;
	}
	public void setMusi_recu_seq(int musi_recu_seq) {
		this.musi_recu_seq = musi_recu_seq;
	}
	@Override
	public String toString() {
		return "RecuMusiInfoDto [recu_musi_info_seq=" + recu_musi_info_seq + ", musiid=" + musiid + ", musi_recu_seq="
				+ musi_recu_seq + "]";
	}
	
	
}
