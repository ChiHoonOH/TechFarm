package com.itbank.TechFarm.tftube.dao;

import java.util.List;

import com.itbank.TechFarm.tftube.dto.RecentVideoDTO;
import com.itbank.TechFarm.tftube.dto.VideoDTO;
import com.itbank.TechFarm.tftube.dto.Video_RecentVideoDTO;

public interface RecentVideoDAO {
	
	public int insertRecent(RecentVideoDTO dto);
	
	public List<RecentVideoDTO> listRecent_member_no(int member_no);
	public List<VideoDTO> listVideo_recent();
	public int recent_delete_all(int member_no);
	public int recent_delete(int recent_no);
	public List<Video_RecentVideoDTO> listVideo_recent(int member_no);
	public String listVideo_last(int member_no);
}
