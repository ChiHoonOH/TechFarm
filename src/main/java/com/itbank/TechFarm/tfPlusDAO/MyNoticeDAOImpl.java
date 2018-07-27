package com.itbank.TechFarm.tfPlusDAO;

import java.util.List;

import com.itbank.TechFarm.tfPlusDTO.MyNoticeDTO;

public class MyNoticeDAOImpl implements MyNoticeDAO {

	@Override
	public int myNoticeInsert(MyNoticeDTO myNoticeDTO) {
		return MyNoticeMapper.myNoticeInsert(myNoticeDTO);
	}

	@Override
	public List myNoticeList(String myId) {
		return MyNoticeMapper.myNoticeList(myId);
	}

	@Override
	public int myNoticeDelete(int myNoticePK) {
		return MyNoticeMapper.myNoticeDelete(myNoticePK);
	}

}
