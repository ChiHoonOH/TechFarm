package com.itbank.TechFarm.tftube.dao;

import java.util.List;


import com.itbank.TechFarm.tftube.dto.ReplyDTO;
import com.itbank.TechFarm.tftube.dto.ReplyDTOFormat;






public interface ReplyDAO {

	public int insertReply(ReplyDTO dto);
	public List<ReplyDTOFormat> replyList_by_video(String video_name);
	public String getName();
	public int update_re_step();
	public int update_re_step_reply(int re_step);
	public int delete_reply(int no);
	
	public int reply_number(String video_name);
	public int delete_reply_video_name(String video_name);
	public int delete_reply_re_step(int re_step);


	
}
