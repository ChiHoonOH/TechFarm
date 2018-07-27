package com.itbank.TechFarm.blog.dao;

import java.util.List;

import com.itbank.TechFarm.blog.dto.Blog_BoardDTO;
import com.itbank.TechFarm.blog.dto.Blog_BoardReplyDTO;
import com.itbank.TechFarm.blog.dto.Blog_MakeBoardDTO;
import com.itbank.TechFarm.blog.dto.Blog_OptionDTO;

public interface Blog_BoardDAO {

	public int makeBoard(Blog_MakeBoardDTO dto);
	public List listBoardTitle(String id);
	public Blog_MakeBoardDTO getBoardTitle(int boardno);
	public int editBoardTitle(Blog_MakeBoardDTO dto);
	public List listBoard(int boardno,int startRow,int endRow);
	public int boardNumber(int boardno);
	public int insertboard(Blog_BoardDTO dto);
	public Blog_BoardDTO getBoard(int no);
	public List listMyBoard(String id);
	public int updateReadcount(int no);	
	public int updateBoard(Blog_BoardDTO dto);
	public int deleteBoard(int no);
	public int deleteAllmyBoard(String id);
	public int insertReply(Blog_BoardReplyDTO dto);
	public int updateRe_step();	
	public int updateRere_step(int re_step);
	public int updateReplyNumber(int no);
	public int minusReplyNumber(int no);
	//public List listReply(int no);
	public List listReply(int no,int startRow,int endRow);
	public int deleteReply(int replyno);
	public int replyNumber(int no);
	public int editReply_pf(Blog_BoardReplyDTO dto);
	public List listSearchBoard(String search_option,String search_text);
	public List imsiBoard(String id);
	public int myBoardNumber(String id);
	public int myReplyNumber(String id);
	
	
	/*
	public int deleteFile(int num);*/
}