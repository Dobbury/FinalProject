package kh.com.a.dao;

import java.util.HashMap;
import java.util.List;

import kh.com.a.model.MemDto;
import kh.com.a.model.VideoBBSDto;
import kh.com.a.model.Video_LikeDto;

public interface VideoBBSDao {
	public boolean writeVideoBBS(VideoBBSDto dto);
	
	public List<VideoBBSDto> getVideoBbsList() throws Exception;
	
	public VideoBBSDto getVideoBbs(int seq);

	public List<VideoBBSDto> getVideoForUser();
	
	public void videoBbsUpdate(VideoBBSDto bbs)throws Exception;
	
	public void videoBbsDelete(int seq)throws Exception;
	

	public void like(Video_LikeDto vlDto);
	
	public void unlike(Video_LikeDto vlDto);
	
	public boolean getLike(Video_LikeDto vlDto);
	
	public boolean incReadCount(int seq);

	public int CheckFollow(HashMap<String, String> map)throws Exception;
	
	public int CancelFollow(HashMap<String, String> map)throws Exception;
	
	public int doFollow(HashMap<String, String> map)throws Exception;
	
	public List<VideoBBSDto> getFollowingList(MemDto dto) throws Exception;
	
	public List<VideoBBSDto> latelyVideoList() throws Exception;
	
	public int HowManyFollowers(String id) throws Exception;
	
}
