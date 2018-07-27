package com.itbank.TechFarm.tftube.dao;



import com.itbank.TechFarm.tftube.dto.MyChannelDTO;
import com.itbank.TechFarm.tftube.mybatis.MyChannelMapper;

public class MyChannelDAOImpl implements MyChannelDAO{


	

	@Override
	public int createChannel(MyChannelDTO dto) {
		return MyChannelMapper.createChannel(dto);
	}


	@Override
	public MyChannelDTO getChannel(int member_no) {
		return MyChannelMapper.getChannel(member_no);		
	}
	
	

	
}
