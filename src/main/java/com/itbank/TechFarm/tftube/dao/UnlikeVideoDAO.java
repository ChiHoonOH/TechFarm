package com.itbank.TechFarm.tftube.dao;

import com.itbank.TechFarm.tftube.dto.UnlikeVideoDTO;

public interface UnlikeVideoDAO {
	
	public  int unlike_insert(UnlikeVideoDTO dto);
	public  int unlike_delete(int member, int no);
	public int unlikecount(int member_no);
	/*public String likevideo_list_ustatus(int member_no,int video_no);*/
	public int likevideo_list_ustatus(int member_no,int video_no);
}
