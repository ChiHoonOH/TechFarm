package com.itbank.TechFarm.tftube.dao;

import com.itbank.TechFarm.tftube.dto.UnlikeVideoDTO;
import com.itbank.TechFarm.tftube.mybatis.UnlikeVideoMapper;

public class UnlikeVideoDAOImpl implements UnlikeVideoDAO{

	@Override
	public int unlike_insert(UnlikeVideoDTO dto) {
		return UnlikeVideoMapper.unlike_insert(dto);
	}

	@Override
	public int unlike_delete(int member, int no) {
		return UnlikeVideoMapper.unlike_delete(member, no);
	}

	@Override
	public int unlikecount(int video_no) {
		return UnlikeVideoMapper.unlikecount(video_no);
	}
	@Override
	public int likevideo_list_ustatus(int member_no, int video_no) {
		return UnlikeVideoMapper.likevideo_list_ustatus(member_no, video_no);
	}
	
	

}
