package com.itbank.TechFarm.tftube.mybatis;

import java.io.Reader;
import java.io.IOException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import com.itbank.TechFarm.tftube.dto.ReplyDTO;
import com.itbank.TechFarm.tftube.dto.ReplyDTOFormat;
import com.itbank.TechFarm.tftube.dto.ReplyFormat;


public class ReplyMapper {
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
	
	public static int insertReply(ReplyDTO dto){
		SqlSession session=sqlMapper.openSession();		
		int res=session.insert("insertReply",dto);
		session.commit();
		session.close();
		return res;
	}

  	public static List<ReplyDTO> listReply(){
  		SqlSession session = sqlMapper.openSession();  	
  		List<ReplyDTO> list = session.selectList("replyList");
  		session.close();
  		return list;
  	}
  	
  	public static List<ReplyDTOFormat> replyList_by_video(String video_name){
  		SqlSession session=sqlMapper.openSession();
  		List<ReplyDTOFormat> list=session.selectList("replyList_by_video",video_name);
  		session.close();
  		return list;
  	}
  	
  	public static String getName(){
  		SqlSession session=sqlMapper.openSession();
  		System.out.println("plist:"+session.selectList("getName"));
  		List list=(List)session.selectList("getName");
  		String name=null;
  		if(list.size()==0){}
  		else{name=(String)list.get(0);}
  		session.close();
  		return name;
  	}
  	
  	public static int update_re_step(){
  		SqlSession session=sqlMapper.openSession();
  		int res=session.update("update_re_step");
  		session.commit();
  		session.close();
  		return res;  		
  	}
  	
  	public static int update_re_step_reply(){
  		SqlSession session=sqlMapper.openSession();
  		int res=session.update("update_re_step_reply");
  		session.commit();
  		session.close();
  		return res;  		
  	}
  	
  	public static int delete_reply(int no){
  	SqlSession session=sqlMapper.openSession();
  	int res=session.delete("deletereply",no);
  	session.commit();
  	session.close();
  	return res;  	
  	}
  	

  	
  	
  	public static int delete_reply_video_name(String video_name){
  		SqlSession session=sqlMapper.openSession();
  	  	int res=session.delete("delete_reply_video_name",video_name);
  	  	session.commit();
  	  	session.close();
  	  	return res; 
  		
  	}


  	public static int reply_number(String video_name){
  		SqlSession session=sqlMapper.openSession();
  		int num=session.selectOne("reply_number",video_name);
  		session.close();
  		return num;  		

  	}
  	
  	public static int delete_reply_re_step(int re_step){
  		SqlSession session=sqlMapper.openSession();
  		int res=session.delete("deletereply_re_step",re_step);
  		session.commit();
  		session.close();
  		return res;
  	}
  	
  	


  	
  	
}