package com.itbank.TechFarm.tftube.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itbank.TechFarm.tftube.dto.LikeVideoDTO;
import com.itbank.TechFarm.tftube.dto.UnlikeVideoDTO;

public class UnlikeVideoMapper {
	
	private static SqlSessionFactory sqlMapper;
	static {
		try {
			String resource = "com/itbank/TechFarm/SqlMapConfig_tftube.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			throw new RuntimeException("Something bad happened while building the SqlMapClient instance." + e, e);
		}
	}

	
	/*
	
	public static String likevideo_list_ustatus(int member_no,int video_no){
		SqlSession session=sqlMapper.openSession();
		java.util.HashMap map = new java.util.HashMap();
		map.put("member_no", member_no);
		map.put("video_no", video_no);
		String list_status = session.selectOne("likevideo_list_ustatus",map);
		return list_status;		
	}*/
	
	public static int unlike_insert(UnlikeVideoDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int res = session.insert("unlike_insert", dto);
		session.commit();
		session.close();
		return res;
	}

	public static int unlike_delete(int member, int no) {
		SqlSession session = sqlMapper.openSession();
		java.util.HashMap map = new java.util.HashMap();
		map.put("member_no", member);
		map.put("video_no", no);
		int res = session.delete("unlike_delete", map);
		session.commit();
		session.close();
		return res;
	}
	public static int unlikecount(int video_no) {
		SqlSession session = sqlMapper.openSession();		
		int list=session.selectOne("unlikecount", video_no);
		session.close();
		return list;
	}
	
	public static int likevideo_list_ustatus(int member_no,int video_no){
		SqlSession session=sqlMapper.openSession();
		java.util.HashMap map = new java.util.HashMap();
		map.put("member_no", member_no);
		map.put("video_no", video_no);
		Object list_status_object = session.selectOne("likevideo_list_ustatus",map);		
		int list_status=0; 
		if(list_status_object!=null){		
			list_status=session.selectOne("likevideo_list_ustatus",map);
		}
		
		session.close();
		return list_status;		
	}
	
	

}
