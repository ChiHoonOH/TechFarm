package com.itbank.TechFarm.login.member;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberMapper {
	private static SqlSessionFactory sqlMapper;

	  static {
	    try {
	    	String resource="com/itbank/TechFarm/SqlMapConfig_tfmember.xml";
	    	Reader reader = Resources.getResourceAsReader(resource); 
			sqlMapper = new SqlSessionFactoryBuilder().build(reader); 
	    } catch (IOException e) {
	      throw new RuntimeException("Something bad happened while building the SqlMapClient instance." + e, e);
	    }
	  }
	  
	  public static MemberDTO getLogin(String id){
		  MemberDTO res=null;
		  SqlSession session=sqlMapper.openSession();
		  res=session.selectOne("getLogin", id);
		  session.close();
		  return res;
	  }
	  
	  public static int insertMember(MemberDTO dto){
		  SqlSession session = sqlMapper.openSession();
			int res=session.insert("insertMember", dto);
			session.commit();
			session.close();
			return res;
	  }
	  
	  public static MemberDTO getMember(String id){
		  MemberDTO res=null;
		  SqlSession session=sqlMapper.openSession();
		  res=session.selectOne("getMember", id);
		  session.close();
		  return res;
	  }
	  
	  public static MemberDTO getMember_by_no(int no){
		  SqlSession session=sqlMapper.openSession();
		  MemberDTO res=(MemberDTO)session.selectOne("getMember_by_no",no);
		  session.close();
		  return res;		  
	  }
	  
	  public static int editMember(MemberDTO dto){
		  SqlSession session = sqlMapper.openSession();
			int res=session.update("editMember", dto);
			session.commit();
			session.close();
			return res;
	  }
	  
	  public static int editPw(MemberDTO dto){
		  SqlSession session = sqlMapper.openSession();
			int res=session.update("editPw", dto);
			session.commit();
			session.close();
			return res;
	  }
	  
	  public static int deleteMember(int no){
		  SqlSession session = sqlMapper.openSession();
			int res=session.delete("deleteMember", no);
			session.commit();
			session.close();
			return res;
	  }
	  
	  public static MemberDTO searchId(String email){
		  SqlSession session = sqlMapper.openSession();
			MemberDTO res=session.selectOne("searchId", email);
			session.commit();
			session.close();
			return res;
	  }
}
