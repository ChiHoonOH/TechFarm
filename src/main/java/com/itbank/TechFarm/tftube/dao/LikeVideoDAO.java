package com.itbank.TechFarm.tftube.dao;


import java.util.List;

import com.itbank.TechFarm.tftube.dto.LikeVideoDTO;
import com.itbank.TechFarm.tftube.dto.VideoDTO;

public interface LikeVideoDAO {	
	public int like_insert(LikeVideoDTO dto);
	public int like_delete(int member,int no);	
	public LikeVideoDTO likevideo_list(int member_no,int no);	
	public int likecount(int member_no);	
	public List<VideoDTO> like_member_list(int member_no);
	/*public String likevideo_list_status(int member_no,int video_no);*/
	public int likevideo_list_status(int member_no,int video_no);	
}
