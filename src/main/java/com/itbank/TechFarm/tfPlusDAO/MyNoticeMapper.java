package com.itbank.TechFarm.tfPlusDAO;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itbank.TechFarm.tfPlusDTO.MyNoticeDTO;

public class MyNoticeMapper {
	
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
	
	public static int myNoticeInsert(MyNoticeDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int res =session.insert("myNoticeInsert",dto);
		session.commit();
		session.close();
		return res;
	}
	
	public static List myNoticeList(String myId) {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("myNoticeList",myId);
		session.close();
		return list;
	}
	
	public static int myNoticeDelete(int myNoticePK) {
		SqlSession session = sqlMapper.openSession();
		int res = session.delete("myNoticeDelete",myNoticePK);
		session.commit();
		session.close();
		return res;
	}
	
}
