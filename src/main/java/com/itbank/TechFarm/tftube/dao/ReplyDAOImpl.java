package com.itbank.TechFarm.tftube.dao;

import java.util.List;


import com.itbank.TechFarm.tftube.dto.ReplyDTO;
import com.itbank.TechFarm.tftube.dto.ReplyDTOFormat;

import com.itbank.TechFarm.tftube.mybatis.ReplyMapper;

public class ReplyDAOImpl implements ReplyDAO {	
	
	@Override
	public int insertReply(ReplyDTO dto) {
		return ReplyMapper.insertReply(dto);
	}

	@Override
	public List<ReplyDTOFormat> replyList_by_video(String video_name) {
		return ReplyMapper.replyList_by_video(video_name);
	}

	@Override
	public String getName() {
		return ReplyMapper.getName();
	}

	@Override
	public int update_re_step() {		
		return ReplyMapper.update_re_step();
	}

	@Override
	public int update_re_step_reply(int re_step) {
		return ReplyMapper.update_re_step_reply();
	}

	@Override
	public int delete_reply(int no) {
		return ReplyMapper.delete_reply(no);
	}

	@Override
	public int reply_number(String video_name) {
		return ReplyMapper.reply_number(video_name);
	}

	@Override
	public int delete_reply_video_name(String video_name) {
		return ReplyMapper.delete_reply_video_name(video_name);
	}

	@Override
	public int delete_reply_re_step(int re_step) {
		return ReplyMapper.delete_reply_re_step(re_step);
	}
	
	
	
	

	
	

	
	
	
	

	
	
	
	
	
	
	

	
	
	
	
	
	
}















