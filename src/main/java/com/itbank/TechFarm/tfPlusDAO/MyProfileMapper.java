package com.itbank.TechFarm.tfPlusDAO;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itbank.TechFarm.tfPlusDTO.MyProfileDTO;

public class MyProfileMapper {
	
	private static SqlSessionFactory sqlMapper;
	static {
	    try {
	    	String resource = "com/itbank/TechFarm/SqlMapConfig_tfplus.xml"; 
	    	Reader reader = Resources.getResourceAsReader(resource);
	    	sqlMapper = new SqlSessionFactoryBuilder().build(reader);
	    } catch (IOException e) {
	    	// Fail fast.
	    	throw new RuntimeException("Something bad happened while building the SqlMapClient instance." + e, e);
	    }
	}
	
	public static int myProfileInsert(MyProfileDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int res = session.insert("myProfileInsert",dto);
		session.commit();
		session.close();
		return res;
	}
	
	public static List myProfileList(String myId) {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("myProfileList",myId);
		session.close();
		return list;
	}
	
	public static int myProfileUpdate(Map mapParameter) {
		SqlSession session = sqlMapper.openSession();
		int res = session.update("myProfileUpdate",mapParameter);
		session.commit();
		session.close();
		return res;
	}
	
	public static MyProfileDTO myProfilePhoto(String myId) {
		SqlSession session = sqlMapper.openSession();
		MyProfileDTO dto = session.selectOne("myProfilePhoto",myId);
		session.close();
		return dto;
	}
	
	public static List myProfileAllList() {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("myProfileAllList");
		session.close();
		return list;
	}
	
}
