package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.TicketDto;

public interface TicketDao {

	public void createTicket(List<TicketDto> list);
	public void buyTicket(TicketDto ticket);
	public int countTicket(TicketDto ticket);
}
