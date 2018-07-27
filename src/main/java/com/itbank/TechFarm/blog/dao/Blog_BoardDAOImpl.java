package com.itbank.TechFarm.blog.dao;

import java.util.List;

import com.itbank.TechFarm.blog.dto.Blog_BoardDTO;
import com.itbank.TechFarm.blog.dto.Blog_BoardReplyDTO;
import com.itbank.TechFarm.blog.dto.Blog_MakeBoardDTO;
import com.itbank.TechFarm.blog.mybatis.BlogMapper;

public class Blog_BoardDAOImpl implements Blog_BoardDAO {

	@Override
	public int makeBoard(Blog_MakeBoardDTO dto) {
		// TODO Auto-generated method stub
		return BlogMapper.makeBoard(dto);
	}

	@Override
	public List listBoardTitle(String id) {
		// TODO Auto-generated method stub
		return BlogMapper.listBoardTitle(id);
	}

	@Override
	public Blog_MakeBoardDTO getBoardTitle(int boardno) {
		// TODO Auto-generated method stub
		return BlogMapper.getBoardT(boardno);
	}

	@Override
	public int editBoardTitle(Blog_MakeBoardDTO dto) {
		// TODO Auto-generated method stub
		return BlogMapper.editBoardT(dto);
	}

	@Override
	public int insertboard(Blog_BoardDTO dto) {
		// TODO Auto-generated method stub
		return BlogMapper.insertBoard(dto);
	}

	@Override
	public List listBoard(int boardno,int startRow,int endRow) {
		// TODO Auto-generated method stub
		return BlogMapper.listBoard(boardno,startRow,endRow);
	}

	@Override
	public Blog_BoardDTO getBoard(int no) {
		// TODO Auto-generated method stub
		return BlogMapper.getBoard(no);
	}

	@Override
	public int updateBoard(Blog_BoardDTO dto) {
		// TODO Auto-generated method stub
		return BlogMapper.updateBoard(dto);
	}

	@Override
	public int deleteBoard(int no) {
		// TODO Auto-generated method stub
		return BlogMapper.deleteBoard(no);
	}

	@Override
	public int insertReply(Blog_BoardReplyDTO dto) {
		// TODO Auto-generated method stub
		return BlogMapper.insertReply(dto);
	}

	@Override
	public int updateRe_step() {
		// TODO Auto-generated method stub
		return BlogMapper.updateRestep();
	}

	@Override
	public int updateRere_step(int re_step) {
		// TODO Auto-generated method stub
		return BlogMapper.updateRerestep(re_step);
	}

	@Override
	public int updateReadcount(int no) {
		// TODO Auto-generated method stub
		return BlogMapper.updateReadcount(no);
	}

	@Override
	public int updateReplyNumber(int no) {
		// TODO Auto-generated method stub
		return BlogMapper.updateReplyNumber(no);
	}

	@Override
	public List listReply(int no,int startRow,int endRow) {
		// TODO Auto-generated method stub
		return BlogMapper.listReply(no,startRow,endRow);
	}

	@Override
	public int deleteReply(int replyno) {
		// TODO Auto-generated method stub
		return BlogMapper.deleteReply(replyno);
	}

	@Override
	public int minusReplyNumber(int no) {
		// TODO Auto-generated method stub
		return BlogMapper.minusReplyNumber(no);
	}

	@Override
	public int replyNumber(int no) {
		// TODO Auto-generated method stub
		return BlogMapper.replyNumber(no);
	}

	@Override
	public List listMyBoard(String id) {
		// TODO Auto-generated method stub
		return BlogMapper.listMyBoard(id);
	}

	@Override
	public int boardNumber(int boardno) {
		// TODO Auto-generated method stub
		return BlogMapper.boardNumber(boardno);
	}

	@Override
	public List listSearchBoard(String search_option, String search_text) {
		// TODO Auto-generated method stub
		return BlogMapper.listSearchBoard(search_option, search_text);
	}

	@Override
	public List imsiBoard(String id) {
		// TODO Auto-generated method stub
		return BlogMapper.imsiBoard(id);
	}

	@Override
	public int myBoardNumber(String id) {
		// TODO Auto-generated method stub
		return BlogMapper.myBoardNumber(id);
	}

	@Override
	public int myReplyNumber(String id) {
		// TODO Auto-generated method stub
		return BlogMapper.myReplyNumber(id);
	}

	@Override
	public int deleteAllmyBoard(String id) {
		// TODO Auto-generated method stub
		return BlogMapper.deleteAllmyBoard(id);
	}

	@Override
	public int editReply_pf(Blog_BoardReplyDTO dto) {
		// TODO Auto-generated method stub
		return BlogMapper.editReply_pf(dto);
	}

	

}
