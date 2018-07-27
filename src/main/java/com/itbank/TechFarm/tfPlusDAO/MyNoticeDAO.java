package com.itbank.TechFarm.tfPlusDAO;

import java.util.List;

import com.itbank.TechFarm.tfPlusDTO.MyNoticeDTO;

public interface MyNoticeDAO {
	public int myNoticeInsert(MyNoticeDTO myNoticeDTO);
	public List myNoticeList(String myId);
	public int myNoticeDelete(int myNoticePK);
}
