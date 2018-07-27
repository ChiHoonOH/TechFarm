package com.itbank.TechFarm.tfPlusDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.itbank.TechFarm.tfPlusDTO.NewsFollowIdDTO;
import com.itbank.TechFarm.tfPlusDTO.NewsProfileAddCommentDTO;
import com.itbank.TechFarm.tfPlusDTO.NewsProfileBoardDTO;
import com.itbank.TechFarm.tfPlusDTO.NewsProfileDTO;

public class NewsProfileDAOImpl implements NewsProfileDAO { 

	@Override
	public List newsGoodList(int startRow, int endRow) {
		Map mapParameter = new HashMap();
		mapParameter.put("startRow", startRow);
		mapParameter.put("endRow", endRow);
		return NewsProfileMapper.newsGoodList(mapParameter);
	} 

	@Override
	public List newsMyList(int startRow, int endRow, String id) {
		Map mapParameter = new HashMap();
		mapParameter.put("startRow", startRow);
		mapParameter.put("endRow", endRow);
		mapParameter.put("id", id);
		return NewsProfileMapper.newsMyList(mapParameter);
	} 

	@Override
	public int newsProfileInsert(NewsProfileDTO newsProfileDTO) {
		return NewsProfileMapper.newsProfileInsert(newsProfileDTO);
	}
	
	@Override
	public boolean newsFollowIdSearch(int num) {
		return NewsProfileMapper.newsFollowIdSearch(num);
	} 

	@Override
	public NewsProfileDTO newsProfileCheck(String name, String profileId) {
		Map mapParameter = new HashMap();
		mapParameter.put("profileName", name);
		mapParameter.put("profileId", profileId);
		return NewsProfileMapper.newsProfileCheck(mapParameter);
	} 
 
	@Override
	public List newsFollowMyList(String id) {
		return NewsProfileMapper.newsFollowMyList(id);
	} 

	@Override
	public NewsProfileDTO newsNumList(int num) {
		return NewsProfileMapper.newsNumList(num);
	} 

	@Override
	public int newsFollowInsert(int profileNum, String id) {
		Map mapParameter = new HashMap();
		mapParameter.put("profileNum", profileNum);
		mapParameter.put("id", id);
		return NewsProfileMapper.newsFollowInsert(mapParameter);
	} 

	@Override
	public List newsFollowAllList() {
		return NewsProfileMapper.followList(); 
	} 

	@Override
	public int newsFollowDelete(int newsfollowPK) {
		return NewsProfileMapper.newsFollowDelete(newsfollowPK);
	} 

	@Override
	public int newsProfileCount() {
		return NewsProfileMapper.newsProfileCount();
	} 

	@Override
	public int newsProfileDelete(int profileNum) {
		return NewsProfileMapper.newsProfileDelete(profileNum);
	} 

	@Override
	public int newsProfileFollow(int profileNum) {
		return NewsProfileMapper.newsProfileFollow(profileNum);
	} 

	@Override
	public int newsProfileUnFollow(int profileNum) {
		return NewsProfileMapper.newsProfileUnFollow(profileNum);
	}

	@Override
	public List newsProfileBoard(String profileName, String profileId) {
		Map mapParameter = new HashMap();
		mapParameter.put("profileName", profileName);
		mapParameter.put("profileId", profileId);
		return NewsProfileMapper.newsProfileBoardList(mapParameter);
	}

	@Override
	public int newsProfileBoardInsert(NewsProfileBoardDTO newsProfileBoardDTO) {
		return NewsProfileMapper.newsProfileBoardInsert(newsProfileBoardDTO);
	}

	@Override
	public boolean newsFollowIdCheck(int num, String id) {
		Map mapParameter = new HashMap();
		mapParameter.put("newsFollowNum", num);
		mapParameter.put("newsFollowId", id);
		return NewsProfileMapper.newsFollowIdCheck(mapParameter);
	}

	@Override
	public List newsProfileTOP(int top) {
		return NewsProfileMapper.newsProfileTOP(top);
	}

	@Override
	public List newsAddList() {
		return NewsProfileMapper.newsAddList();
	}

	@Override
	public int newsAddListInsert(NewsProfileAddCommentDTO newsProfileAddCommentDTO) {
		return NewsProfileMapper.newsAddListInsert(newsProfileAddCommentDTO);
	}

	@Override
	public int newsAddDelete(int profileAddPK) {
		return NewsProfileMapper.newsAddDelete(profileAddPK);
	}

	@Override
	public NewsProfileDTO newsProfileUpdate(int profileNum) {
		return NewsProfileMapper.newsProfileUpdate(profileNum);
	}

	@Override
	public int newsProfileUpdatePro(NewsProfileDTO newsProfileDTO) {
		return NewsProfileMapper.newsProfileUpdatePro(newsProfileDTO);
	}

	@Override
	public List newsFollowNotice(int profileNum) { 
		return NewsProfileMapper.newsFollowNotice(profileNum);
	}

	@Override
	public int newsProfileBoardDelete(int profileBoardPK) {
		return NewsProfileMapper.newsProfileBoardDelete(profileBoardPK);
	}

	@Override
	public NewsProfileBoardDTO newsProfileBoardUpdate(int profileBoardPK) {
		return NewsProfileMapper.newsProfileBoardUpdate(profileBoardPK);
	}

	@Override
	public int newsProfileBoardUpdatePro(NewsProfileBoardDTO dto) {
		return NewsProfileMapper.newsProfileBoardUpdatePro(dto);
	}

	@Override
	public int newsAddUpdateSub(int sql) {
		return NewsProfileMapper.newsAddUpdateSub(sql);
	}

	@Override
	public int newsAddUpdateSub2() {
		return NewsProfileMapper.newsAddUpdateSub2();
	}

	@Override
	public List newsProfileOption(String option) {
		return NewsProfileMapper.newsProfileOption(option);
	}

	@Override
	public List tfPlusList(String profileId) {
		return NewsProfileMapper.tfPlusList(profileId);
	}

	@Override
	public NewsProfileDTO tfPlusNews(String profileId) {
		return NewsProfileMapper.tfPlusNews(profileId);
	}
	
}
