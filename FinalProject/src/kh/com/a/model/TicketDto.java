package kh.com.a.model;

import java.io.Serializable;

public class TicketDto implements Serializable {
	
	private int ticket_seq;
	private String ticket_serial;
	private int schedule_seq;
	private String memid;
	public TicketDto() {
		super();
	}
	public TicketDto(int ticket_seq, String ticket_serial, int schedule_seq, String memid) {
		super();
		this.ticket_seq = ticket_seq;
		this.ticket_serial = ticket_serial;
		this.schedule_seq = schedule_seq;
		this.memid = memid;
	}
	public int getTicket_seq() {
		return ticket_seq;
	}
	public void setTicket_seq(int ticket_seq) {
		this.ticket_seq = ticket_seq;
	}
	public String getTicket_serial() {
		return ticket_serial;
	}
	public void setTicket_serial(String ticket_serial) {
		this.ticket_serial = ticket_serial;
	}
	public int getSchedule_seq() {
		return schedule_seq;
	}
	public void setSchedule_seq(int schedule_seq) {
		this.schedule_seq = schedule_seq;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	@Override
	public String toString() {
		return "TicketDto [ticket_seq=" + ticket_seq + ", ticket_serial=" + ticket_serial + ", schedule_seq="
				+ schedule_seq + ", memid=" + memid + "]";
	}
	
	
}
