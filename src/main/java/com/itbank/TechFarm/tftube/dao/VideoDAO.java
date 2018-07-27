package com.itbank.TechFarm.tftube.dao;

import java.util.List;

import com.itbank.TechFarm.tftube.dto.LikeVideoDTO;
import com.itbank.TechFarm.tftube.dto.VideoDTO;
import com.itbank.TechFarm.tftube.dto.Video_RecentVideoDTO;

public interface VideoDAO {
	
	public int insertVideo(VideoDTO dto);
	public List<VideoDTO> listVideo();
	public VideoDTO getVideo(int no);
	public int deleteVideo(int no);
	public int hitUp(int no);
	public List<Video_RecentVideoDTO> listRecent_inf(int member_no);
	public List<VideoDTO> listVideo_member_no(int member_no);
	public List<VideoDTO> listLike(int member_no);
	public int updateLike(VideoDTO dto);
	public List<VideoDTO> listVideo_category(String category);
	public int updateVideo(VideoDTO dto);
	
	
	
	
}
