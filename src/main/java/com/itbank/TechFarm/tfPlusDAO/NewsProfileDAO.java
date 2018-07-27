package com.itbank.TechFarm.tfPlusDAO;

import java.util.List;

import com.itbank.TechFarm.tfPlusDTO.NewsFollowIdDTO;
import com.itbank.TechFarm.tfPlusDTO.NewsProfileAddCommentDTO;
import com.itbank.TechFarm.tfPlusDTO.NewsProfileBoardDTO;
import com.itbank.TechFarm.tfPlusDTO.NewsProfileDTO;

public interface NewsProfileDAO {
	public List newsGoodList(int startRow, int endRow); 
	public List newsMyList(int startRow, int endRow, String id); 
	public int newsProfileInsert(NewsProfileDTO newsProfileDTO); 
	public int newsProfileBoardInsert(NewsProfileBoardDTO newsProfileBoardDTO);
	public boolean newsFollowIdSearch(int num); 
	public boolean newsFollowIdCheck(int num, String id);
	public NewsProfileDTO newsProfileCheck(String name, String profileId); 
	public List newsFollowMyList(String id); 
	public NewsProfileDTO newsNumList(int num); 
	public int newsFollowInsert(int profileNum, String id); 
	public List newsFollowAllList(); 
	public int newsFollowDelete(int newsfollowPK); 
	public int newsProfileCount();
	public int newsProfileDelete(int profileNum); 
	public int newsProfileFollow(int profileNum); 
	public int newsProfileUnFollow(int profileNum); 
	public List newsProfileBoard(String profileName, String profileId);
	public List newsProfileTOP(int top);
	public List newsAddList();
	public int newsAddListInsert(NewsProfileAddCommentDTO newsProfileAddCommentDTO);
	public int newsAddDelete(int profileAddPK);
	public NewsProfileDTO newsProfileUpdate(int profileNum);
	public int newsProfileUpdatePro(NewsProfileDTO newsProfileDTO);
	public List newsFollowNotice(int profileNum);
	public int newsProfileBoardDelete(int profileBoardPK);
	public NewsProfileBoardDTO newsProfileBoardUpdate(int profileBoardPK);
	public int newsProfileBoardUpdatePro(NewsProfileBoardDTO dto);
	public int newsAddUpdateSub(int sql);
	public int newsAddUpdateSub2();
	public List newsProfileOption(String option);
	public List tfPlusList(String profileId);
	public NewsProfileDTO tfPlusNews(String profileId);
}
