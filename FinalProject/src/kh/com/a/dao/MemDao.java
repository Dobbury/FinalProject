package kh.com.a.dao;

import kh.com.a.model.MemDto;

public interface MemDao {
	public MemDto login(String id);
	public void addMusition(MemDto dto);
	public void addGeneral(MemDto dto);
	
	public void updateMusition(MemDto dto);
	public void updateGeneral(MemDto dto);
	
	
}
