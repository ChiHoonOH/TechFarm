package com.itbank.TechFarm.tftube;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.itbank.TechFarm.login.member.MemberDTO;
import com.itbank.TechFarm.tftube.dao.ReplyDAO;
import com.itbank.TechFarm.tftube.dto.ReplyDTO;




@Controller
public class ReplyController {
	
	@Autowired
	private ReplyDAO replyDAO;	

	private HttpSession session=null;
	private String msg=null, url=null;	
	
	@RequestMapping(value="/tftube_reply_insert")
	public ModelAndView tftube_reply_insert(HttpServletRequest arg0, 
								HttpServletResponse arg1) throws Exception {
		ModelAndView mv=new ModelAndView();	
		
		session=arg0.getSession();
		Object member_raw=session.getAttribute("memberDTO");
		if(member_raw==null){
				msg="로그인이 필요한 서비스 입니다. 로그인을 해주세요.";
				url="login";
				mv.addObject("msg",msg);
				mv.addObject("url",url);
				mv.setViewName("tftube/message");					
		}
		MemberDTO member=(MemberDTO)member_raw;
		ReplyDTO dto=new ReplyDTO();//space to save reply information.	
		
		String re_step_raw=arg0.getParameter("re_step");//not exist reply
		String re_level_raw=arg0.getParameter("re_level");
		
		int re_step=0;
		int re_level=0;
		if(re_step_raw!=null){
		re_step=Integer.parseInt(re_step_raw);}
		if(re_level_raw!=null){
			re_level=Integer.parseInt(re_level_raw);
		}
		
		String mode=arg0.getParameter("mode");		
		String content=null;
		int res=0;	
		
		dto.setMember_no(member.getNo());		
		dto.setVideo_name(arg0.getParameter("video_name"));
		
		if(mode.equals("general")){			
			content=arg0.getParameter("content");			 
			dto.setRe_level(0);
			dto.setRe_step(0);
			dto.setContent(content);
			
			res=replyDAO.insertReply(dto);
			replyDAO.update_re_step();
		}else{
			 content=arg0.getParameter("content_reply");
		
			 dto.setRe_level(1);//distinction reply and re_reply
			 dto.setRe_step(re_step);			
			 dto.setContent(content);			 
			 res=replyDAO.insertReply(dto);
			 replyDAO.update_re_step_reply(re_step);
		}
		
		
		
		int no=(Integer)session.getAttribute("video_no");
		if(res>0){
			mv.setViewName("redirect:tftube_videoView?no="+no);			
		}
		else{
			msg="fail to reply";
			url="tftube_main";
			mv.setViewName("tftube/message");
			mv.addObject("msg",msg);
			mv.addObject("url",url);				
		}			
		return mv;		
	}
	
	@RequestMapping(value="/tftube_reply_delete")
	public ModelAndView tftube_reply_delete(HttpServletRequest arg0, 
								HttpServletResponse arg1) throws Exception {
		ModelAndView mv=new ModelAndView();
		
		int no=0;
		/*ReplyDTO rdto=(ReplyDTO)arg0.getParameter("rdto");
		String rdto_raw=arg0.getParameter("rdto");
		if(rdto_raw!=null){
			rdto=(ReplyDTO)rdto_raw;
		}*/
		int r_no=0;
		int re_step=0;
		int re_level=0;
		/*ReplyDTO rdto=(ReplyDTO)arg0.getAttribute("rdto");*/
		
		//re_step, re_level
		String no_raw=arg0.getParameter("no");//video number
		String re_step_raw=arg0.getParameter("re_step");
		String re_level_raw=arg0.getParameter("re_level");
		if(no_raw!=null){
		no=Integer.parseInt(no_raw);}
		if(re_step_raw!=null){
			re_step=Integer.parseInt(re_step_raw);
		}
		
		if(re_level_raw!=null){
			re_level=Integer.parseInt(re_level_raw);
		}
		
		
		String r_no_raw=arg0.getParameter("r_no");//reply number
		if(r_no_raw!=null){
		r_no=Integer.parseInt(r_no_raw);}
		
		int res=0;
		
		if(re_level==1){
		res=replyDAO.delete_reply(r_no);}
		else{
		res=replyDAO.delete_reply_re_step(re_step);
		}
		
		if(res>0){
			mv.setViewName("redirect:tftube_videoView?no="+no);			
		}
		else{
			msg="fail to delete";
			url="tftube_main";
			mv.setViewName("tftube/message");
			mv.addObject("msg",msg);
			mv.addObject("url",url);				
		}		
		return mv;		
	}	

}
