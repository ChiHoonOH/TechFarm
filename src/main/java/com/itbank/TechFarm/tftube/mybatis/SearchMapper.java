package com.itbank.TechFarm.tftube.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itbank.TechFarm.tftube.dto.VideoDTO;

public class SearchMapper {
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
	
	
	public static List<VideoDTO> search_single(String search,String search_text){
		SqlSession session=sqlMapper.openSession();
		HashMap map=new HashMap();		
		map.put("sql","select * from tftube_video where "+search+" like "+"'%"+search_text.trim()+"%'");
		List<VideoDTO> list=session.selectList("search_single",map);		
		session.close();
		return list;		
	}

	
	
}
