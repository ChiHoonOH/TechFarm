package com.itbank.TechFarm.tftube.dao;

import java.util.List;

import com.itbank.TechFarm.tftube.dto.SubingDTO;
import com.itbank.TechFarm.tftube.dto.Subing_ChannelDTO;
import com.itbank.TechFarm.tftube.mybatis.SubingMapper;

public class SubingDAOImpl implements SubingDAO{

	@Override
	public int insertSubing(SubingDTO sidto) {
		return SubingMapper.insertSubing(sidto);
	}

	@Override
	public List<Subing_ChannelDTO> get_subing_member(int member_no) {
		return SubingMapper.get_subing_member(member_no);
	}

	@Override
	public int deleteSubing(SubingDTO dto) {
		return SubingMapper.deleteSubing(dto);
	}

	@Override
	public SubingDTO select_subing(SubingDTO dto) {
		return SubingMapper.select_subing(dto);
	}

	@Override
	public List<Subing_ChannelDTO> get_subed_member(int subing_member_no) {
		return SubingMapper.get_subed_member(subing_member_no);
	}
	
	
	
	

	
	
}
