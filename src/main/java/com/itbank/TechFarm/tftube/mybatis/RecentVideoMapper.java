package com.itbank.TechFarm.tftube.mybatis;


import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itbank.TechFarm.tftube.dto.RecentVideoDTO;
import com.itbank.TechFarm.tftube.dto.VideoDTO;
import com.itbank.TechFarm.tftube.dto.Video_RecentVideoDTO;

public class RecentVideoMapper {
	
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
	
	public static int insertRecent(RecentVideoDTO dto){
		SqlSession session=sqlMapper.openSession();
		int res=session.insert("insertRecent", dto);
		session.commit();
		session.close();
		return res;	
	}
	
	public static List<RecentVideoDTO> listRecent_member_no(int member_no){
		SqlSession session=sqlMapper.openSession();
		List<RecentVideoDTO> list=session.selectList("listRecent_member_no",member_no);
		session.close();
		return list;	
	}
	
	public static List<VideoDTO> listVideo_recent(){
		SqlSession session=sqlMapper.openSession();
		List<VideoDTO> list=session.selectList("listVideo_recent");
		session.close();
		return list;	
	}
	
	public static int recent_delete_all(int member_no){
		SqlSession session=sqlMapper.openSession();
		int res=session.delete("recent_delete_all",member_no);
		session.commit();
		session.close();
		return res;
	}
	
	public static int recent_delete(int recent_no){
		SqlSession session=sqlMapper.openSession();
		int res=session.delete("recent_delete",recent_no);
		session.commit();
		session.close();
		return res;
	}
	
	public static List<Video_RecentVideoDTO> listVideo_recent(int member_no){
		SqlSession session=sqlMapper.openSession();
		List<Video_RecentVideoDTO> res=session.selectList("listVideo_recent",member_no);
		
		session.close();
		return res;
		
		
	}
	
	public static String listVideo_last(int member_no){
		SqlSession session=sqlMapper.openSession();
		String video_name=session.selectOne("listVideo_last",member_no);
		session.close();
		return video_name;
	}

}
