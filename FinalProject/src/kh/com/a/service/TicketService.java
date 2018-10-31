package kh.com.a.service;

import java.util.List;

import kh.com.a.model.TicketDto;

public interface TicketService {
	public void createTicket(List<TicketDto> list);
	public void buyTicket(TicketDto ticket);
	public int countTicket(TicketDto ticket);
}
