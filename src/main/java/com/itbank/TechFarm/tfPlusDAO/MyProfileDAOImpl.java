package com.itbank.TechFarm.tfPlusDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.itbank.TechFarm.tfPlusDTO.MyProfileDTO;

public class MyProfileDAOImpl implements MyProfileDAO {

	@Override
	public int myProfileInsert(MyProfileDTO myProfileDTO) {
		return MyProfileMapper.myProfileInsert(myProfileDTO);
	}

	@Override
	public List myProfileList(String myId) {
		return MyProfileMapper.myProfileList(myId);
	}

	@Override
	public int myProfileUpdate(String photo,String hobby,String myId) {
		Map mapParameter = new HashMap();
		mapParameter.put("photo", photo);
		mapParameter.put("hobby", hobby);
		mapParameter.put("myId", myId);
		return MyProfileMapper.myProfileUpdate(mapParameter);
	}

	@Override
	public MyProfileDTO myProfilePhoto(String myId) {
		return MyProfileMapper.myProfilePhoto(myId);
	}

	@Override
	public List myProfileAllList() {
		return MyProfileMapper.myProfileAllList();
	}

}
