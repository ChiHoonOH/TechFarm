package com.itbank.TechFarm.tftube.dao;

import java.util.List;

import com.itbank.TechFarm.tftube.dto.SubingDTO;
import com.itbank.TechFarm.tftube.dto.Subing_ChannelDTO;

public interface SubingDAO {
	
	public int insertSubing(SubingDTO sidto);
	public List<Subing_ChannelDTO> get_subing_member(int member_no);
	public int deleteSubing(SubingDTO dto);
	public SubingDTO select_subing(SubingDTO dto);
	public List<Subing_ChannelDTO> get_subed_member(int subing_member_no);
	
	
}
