package com.itbank.TechFarm.tftube.dao;


import com.itbank.TechFarm.tftube.dto.MyChannelDTO;

public interface MyChannelDAO {

	public int createChannel(MyChannelDTO dto);	
	public MyChannelDTO getChannel(int member_no);
}
