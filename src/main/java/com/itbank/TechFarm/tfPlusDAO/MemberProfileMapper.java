package com.itbank.TechFarm.tfPlusDAO;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itbank.TechFarm.tfPlusDTO.MemberProfileAddCommentDTO;
import com.itbank.TechFarm.tfPlusDTO.MemberProfileBoardDTO;
import com.itbank.TechFarm.tfPlusDTO.MemberProfileDTO;

public class MemberProfileMapper {
	
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
	
	public static List memberGoodList(Map mapParameter) {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("memberGoodList",mapParameter);
		session.close();
		return list;
	}
	
	public static List joinList() {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("joinList");
		session.close();
		return list;
	}
	
	public static int memberProfileCount() {
		SqlSession session = sqlMapper.openSession();
		int count = session.selectOne("memberProfileCount");
		session.close();
		return count;
	}
	
	public static List memberMyList(Map mapParameter) {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("memberMyList",mapParameter);
		session.close();
		return list;
	}
	
	public static List memberJoinMyList(String id) {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("memberJoinMyList",id);
		session.close();
		return list;
	}
	
	public static MemberProfileDTO memberNumList(int num) {
		SqlSession session = sqlMapper.openSession();
		MemberProfileDTO dto = session.selectOne("memberNumList",num);
		session.close();
		return dto;
	}
	
	public static List memberAddList() {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("memberAddList");
		session.close();
		return list;
	}
	
	public static List memberProfileBoardList(Map mapParameter) {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("memberProfileBoardList",mapParameter);
		session.close();
		return list;
	}
	
	public static boolean memberJoinIdCheck(Map mapParameter) {
		boolean bool;
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("memberJoinIdCheck", mapParameter);
		session.close();
		if(list.size() == 0){
			bool = false;
		} else {
			bool = true;
		}
		return bool;
	}
	
	public static int memberProfileInsert(MemberProfileDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int res = session.insert("memberProfileInsert",dto);
		session.commit();
		session.close();
		return res;
	}
	
	public static int memberProfileBoardInsert(MemberProfileBoardDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int res = session.insert("memberProfileBoardInsert",dto);
		session.commit();
		session.close();
		return res;
	}
	
	public static boolean memberJoinIdSearch(int num) {
		boolean bool;
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("memberJoinIdSearch",num);
		session.close();
		if(list.size() == 0 ) {
			bool = false;
		} else {
			bool = true;
		}
		return bool;
	}
	
	public static MemberProfileDTO memberProfileCheck(Map mapParameter) {
		SqlSession session = sqlMapper.openSession();
		MemberProfileDTO dto = session.selectOne("memberProfileCheck",mapParameter);
		session.close();
		return dto;
	}
	
	public static int memberJoinInsert(Map mapParameter) {
		SqlSession session = sqlMapper.openSession();
		int res = session.insert("memberJoinInsert",mapParameter);
		session.commit();
		session.close();
		return res;
	}
	
	public static int memberJoinDelete(int memberJoinPK) {
		SqlSession session = sqlMapper.openSession();
		int res = session.delete("memberJoinDelete",memberJoinPK);
		session.commit();
		session.close();
		return res;
	}
	
	public static int memberProfileDelete(int profileNum) {
		SqlSession session = sqlMapper.openSession();
		int res = session.delete("memberProfileDelete",profileNum);
		session.commit();
		session.close();
		return res;
	}
	
	public static int memberProfileJoin(int profileNum) {
		SqlSession session = sqlMapper.openSession();
		int res = session.update("memberProfileJoin",profileNum);
		session.commit();
		session.close();
		return res;
	}
	
	public static int memberProfileUnJoin(int profileNum) {
		SqlSession session = sqlMapper.openSession();
		int res = session.update("memberProfileUnJoin",profileNum);
		session.commit();
		session.close();
		return res;
	}
	
	public static List memberProfileTOP(int top) {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("memberProfileTOP",top);
		session.close();
		return list;
	}
	
	public static int memberAddListInsert(MemberProfileAddCommentDTO memberProfileAddCommentDTO) {
		SqlSession session = sqlMapper.openSession();
		int res = session.insert("memberAddListInsert",memberProfileAddCommentDTO);
		session.commit();
		session.close();
		return res;
	}
	
	public static int memberAddDelete(int profileAddPK) {
		SqlSession session = sqlMapper.openSession();
		int res = session.delete("memberAddDelete",profileAddPK);
		session.commit();
		session.close();
		return res;
	}
	
	public static MemberProfileDTO memberProfileUpdate(int profileNum) {
		SqlSession session = sqlMapper.openSession();
		MemberProfileDTO dto = session.selectOne("memberProfileUpdate",profileNum);
		session.close();
		return dto;
	}
	
	public static int memberProfileUpdatePro(MemberProfileDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int res = session.update("memberProfileUpdatePro",dto);
		session.commit();
		session.close();
		return res;
	}
	
	public static int memberProfileBoardDelete(int profileBoardPK) {
		SqlSession session = sqlMapper.openSession();
		int res = session.delete("memberProfileBoardDelete",profileBoardPK);
		session.commit();
		session.close();
		return res;
	}
	
	public static MemberProfileBoardDTO memberProfileBoardUpdate(int profileBoardPK) {
		SqlSession session = sqlMapper.openSession();
		MemberProfileBoardDTO dto = new MemberProfileBoardDTO();
		dto = session.selectOne("memberProfileBoardUpdate",profileBoardPK);
		session.close();
		return dto;
	}
	
	public static int memberProfileBoardUodatePro(MemberProfileBoardDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int res = session.update("memberProfileBoardUpdatePro",dto);
		session.commit();
		session.close();
		return res;
	}
	
	public static int memberAddUpdateSub(int sql) {
		SqlSession session = sqlMapper.openSession();
		int res = session.update("memberAddUpdateSub",sql);
		session.commit();
		session.close();
		return res;
	}
	
	public static int memberAddUpdateSub2() {
		SqlSession session = sqlMapper.openSession();
		int res = session.update("memberAddUpdateSub2");
		session.commit();
		session.close();
		return res;
	}
	
}
