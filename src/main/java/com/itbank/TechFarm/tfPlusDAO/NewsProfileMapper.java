package com.itbank.TechFarm.tfPlusDAO;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itbank.TechFarm.tfPlusDTO.NewsFollowIdDTO;
import com.itbank.TechFarm.tfPlusDTO.NewsProfileAddCommentDTO;
import com.itbank.TechFarm.tfPlusDTO.NewsProfileBoardDTO;
import com.itbank.TechFarm.tfPlusDTO.NewsProfileDTO;

public class NewsProfileMapper {

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
	
	public static List newsGoodList(Map mapParameter) {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("newsGoodList",mapParameter);
		session.close();
		return list;
	}
	
	public static List newsMyList(Map mapParameter) {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("newsMyList",mapParameter);
		session.close();
		return list;
	} 
	
	public static int newsProfileInsert(NewsProfileDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int res = session.insert("newsProfileInsert",dto);
		session.commit();
		session.close();
		return res;
	}
	
	public static int newsProfileBoardInsert(NewsProfileBoardDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int res = session.insert("newsProfileBoardInsert",dto);
		session.commit();
		session.close();
		return res;
	}
	
	public static boolean newsFollowIdSearch(int num) {
		boolean bool;
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("newsFollowIdSearch",num);
		session.close();
		if(list.size() == 0) {
			bool = false;
		} else {
			bool = true;
		}
		return bool;
	} 
	
	public static boolean newsFollowIdCheck(Map mapParameter) {
		boolean bool;
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("newsFollowIdCheck", mapParameter);
		session.close();
		if(list.size() == 0){
			bool = false;
		} else {
			bool = true;
		}
		return bool;
	}
	
	public static NewsProfileDTO newsProfileCheck(Map mapParameter) {
		SqlSession session = sqlMapper.openSession();
		NewsProfileDTO dto = session.selectOne("newsProfileCheck",mapParameter);
		session.close();
		return dto;
	}
	
	public static List newsFollowMyList(String id) {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("newsFollowMyList",id);
		session.close();
		return list;
	}
	
	public static NewsProfileDTO newsNumList(int num) {
		SqlSession session = sqlMapper.openSession();
		NewsProfileDTO dto = session.selectOne("newsNumList",num);
		session.close();
		return dto;
	} 
	
	public static int newsFollowInsert(Map mapParameter) {
		SqlSession session = sqlMapper.openSession();
		int res = session.insert("newsFollowInsert",mapParameter);
		session.commit();
		session.close();
		return res;
	}
	
	public static List followList() {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("followList");
		session.close();
		return list;
	}
	
	public static int newsFollowDelete(int newsfollowPK) {
		SqlSession session = sqlMapper.openSession();
		int res = session.delete("newsFollowDelete",newsfollowPK);
		session.commit();
		session.close();
		return res;
	}
	
	public static int newsProfileCount() {
		SqlSession session = sqlMapper.openSession();
		int count = session.selectOne("newsProfileCount");
		session.close();
		return count;
	} 
	
	public static int newsProfileDelete(int profilwNum) {
		SqlSession session = sqlMapper.openSession();
		int res = session.delete("newsProfileDelete",profilwNum);
		session.commit();
		session.close();
		return res;
	} 
	
	public static int newsProfileFollow(int profileNum) {
		SqlSession session = sqlMapper.openSession();
		int res = session.update("newsProfileFollow",profileNum);
		session.commit();
		session.close();
		return res;
	}
	
	public static int newsProfileUnFollow(int profileNum) {
		SqlSession session = sqlMapper.openSession();
		int res = session.update("newsProfileUnFollow",profileNum);
		session.commit();
		session.close();
		return res;
	} 
	
	public static List newsProfileBoardList(Map mapParameter) {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("newsProfileBoardList",mapParameter);
		session.close();
		return list;
	}
	
	public static List newsProfileTOP(int top) {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("newsProfileTOP",top);
		session.close();
		return list;
	}
	
	public static List newsAddList() {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("newsAddList");
		session.close();
		return list;
	}
	
	public static int newsAddListInsert(NewsProfileAddCommentDTO newsProfileAddCommentDTO) {
		SqlSession session = sqlMapper.openSession();
		int res = session.insert("newsAddListInsert",newsProfileAddCommentDTO);
		session.commit();
		session.close();
		return res;
	}
	
	public static int newsAddDelete(int profileAddPK) {
		SqlSession session = sqlMapper.openSession();
		int res = session.delete("newsAddDelete",profileAddPK);
		session.commit();
		session.close();
		return res;
	}
	
	public static NewsProfileDTO newsProfileUpdate(int profileNum) {
		SqlSession session = sqlMapper.openSession();
		NewsProfileDTO dto = session.selectOne("newsProfileUpdate",profileNum);
		session.close();
		return dto;
	}
	
	public static int newsProfileUpdatePro(NewsProfileDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int res = session.update("newsProfileUpdatePro",dto);
		session.commit();
		session.close();
		return res;
	}
	
	public static List newsFollowNotice(int profileNum) {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("newsFollowNotice",profileNum);
		session.close();
		return list;
	}
	
	public static int newsProfileBoardDelete(int profileBoardPK) {
		SqlSession session = sqlMapper.openSession();
		int res = session.delete("newsProfileBoardDelete",profileBoardPK);
		session.commit();
		session.close();
		return res;
	}
	
	public static NewsProfileBoardDTO newsProfileBoardUpdate(int profileBoardPK) {
		SqlSession session = sqlMapper.openSession();
		NewsProfileBoardDTO dto = new NewsProfileBoardDTO();
		dto = session.selectOne("newsProfileBoardUpdate",profileBoardPK);
		session.close();
		return dto;
	}
	
	public static int newsProfileBoardUpdatePro(NewsProfileBoardDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int res = session.update("newsProfileBoardUpdatePro",dto);
		session.commit();
		session.close();
		return res;
	}
	
	public static int newsAddUpdateSub(int sql) {
		SqlSession session = sqlMapper.openSession();
		int res = session.update("newsAddUpdateSub",sql);
		session.commit();
		session.close();
		return res;
	}
	
	public static int newsAddUpdateSub2() {
		SqlSession session = sqlMapper.openSession();
		int res = session.update("newsAddUpdateSub2");
		session.commit();
		session.close();
		return res;
	}
	
	public static List newsProfileOption(String option) {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("newsProfileOption",option);
		session.close();
		return list;
	}
	
	public static List tfPlusList(String profileId) {
		SqlSession session = sqlMapper.openSession();
		List list = session.selectList("tfPlusList",profileId);
		session.close();
		return list;
	}
	
	public static NewsProfileDTO tfPlusNews(String profileId) {
		SqlSession session = sqlMapper.openSession();
		NewsProfileDTO dto = new NewsProfileDTO();
		dto = session.selectOne("tfPlusNews",profileId);
		session.close();
		return dto;
	}
	
}
