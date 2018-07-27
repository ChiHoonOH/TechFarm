package com.itbank.TechFarm.tfPlusDAO;

import java.util.List;

import com.itbank.TechFarm.tfPlusDTO.MyProfileDTO;

public interface MyProfileDAO {
	public int myProfileInsert(MyProfileDTO myProfileDTO);
	public List myProfileList(String myId);
	public int myProfileUpdate(String photo,String hobby,String id);
	public MyProfileDTO myProfilePhoto(String id);
	public List myProfileAllList();
}
