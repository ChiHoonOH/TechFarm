package com.itbank.TechFarm.tftube;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.TechFarm.login.member.MemberDTO;
import com.itbank.TechFarm.tftube.dao.RecentVideoDAO;
import com.itbank.TechFarm.tftube.dto.Video_RecentVideoDTO;


@Controller
public class RecentVideoController {
	@Autowired
	private RecentVideoDAO recentvideoDAO;
		
	private HttpSession session=null;
	String msg=null, url=null;	
	
	@RequestMapping(value="/tftube_recentvideo_listRecent_member_no", method=RequestMethod.GET)
	public ModelAndView tftube_recentvideo_listRecent_member_no(HttpServletRequest arg0, 
								HttpServletResponse arg1) throws Exception {		
		ModelAndView mv=new ModelAndView();
		session=arg0.getSession();
		MemberDTO member=null;
		
		Object memberDTO_raw=session.getAttribute("memberDTO");
		if(memberDTO_raw==null){		 
			msg="로그인이 필요한 서비스 입니다. 로그인을 해주세요.";
			url="login";
			mv.addObject("msg",msg);			
			mv.addObject("url",url);			
			mv.setViewName("tftube/message");
			return mv;
		}else{
			member=(MemberDTO)memberDTO_raw;
		}			
		
		List<Video_RecentVideoDTO> recent_list=recentvideoDAO.listVideo_recent(member.getNo());		
		
		
		mv.addObject("recent_list",recent_list);		
		mv.setViewName("tftube/recentVideo");		
		return mv;
	}
	/*//왜 만들었는지 이해 불가능한 코드
	@RequestMapping(value="/tftube_recentvideo_insert", method=RequestMethod.GET)
	public ModelAndView tftube_recentvideo_insert(HttpServletRequest arg0, 
								HttpServletResponse arg1) throws Exception {		
		ModelAndView mv=new ModelAndView();
		//RecentVideo insert
		String no_raw=arg0.getParameter("no");//no of video
		//videoView or main
		int no=0;		
		if(no_raw!=null){
		no=Integer.parseInt(no_raw);}//tftube_video
		
		MemberDTO member=null;
		Object member_object=session.getAttribute("memberDTO");
		
		VideoDTO vdto=videoDAO.getVideo(no);
		
		if(member_object!=null){
		member=(MemberDTO)member_object;
		}	
		RecentVideoDTO recent_dto=new RecentVideoDTO();
				
		if(member_object!=null){
		recent_dto.setMember_no(member.getNo());
		recent_dto.setVideo_name(vdto.getVideo_name());		
		recentvideoDAO.insertRecent(recent_dto);
		}
				//end of RecentVideo insert 
		mv.addObject("tftubevideoView");//이건 뭐니?
		return mv;
	}*/
	
	@RequestMapping(value="/tftube_recentvideo_delete_all", method=RequestMethod.GET)
	public ModelAndView tftube_recent_delall(HttpServletRequest arg0, 
								HttpServletResponse arg1) throws Exception {
		ModelAndView mv=new ModelAndView();
		Object member_raw=session.getAttribute("memberDTO");
		MemberDTO member=null;
		if(member_raw!=null){
		member=(MemberDTO)member_raw;}
		
		if(member_raw!=null){
		recentvideoDAO.recent_delete_all(member.getNo());
		mv.setViewName("tftube/recentVideo");
		}else{
			msg="로그인이 필요한 서비스 입니다. 로그인을 해주세요.";
			url="login";
			mv.addObject("msg",msg);			
			mv.addObject("url",url);			
			mv.setViewName("tftube/message");			
		}		
		
		
		return mv;		
	}
	
	@RequestMapping(value="/tftube_recentvideo_delete", method=RequestMethod.GET)
	public ModelAndView tftube_recent_del(HttpServletRequest arg0, 
								HttpServletResponse arg1) throws Exception {
		ModelAndView mv=new ModelAndView();
		Object member_raw=session.getAttribute("memberDTO");
		//MemberDTO member=(MemberDTO)member_raw;
		String recent_no_raw=arg0.getParameter("recent_no");
		int no=0;
		if(recent_no_raw!=null){
			no=Integer.parseInt(recent_no_raw);			
		}else{
			msg="영상 정보가 존재 하지 않습니다. 메인 페이지로 이동합니다.";
			url="tftube_main";
			mv.addObject("msg",msg);
			mv.addObject("url",url);
			mv.setViewName("tftube/message");
		}
		System.out.println("내생각엔 recent_no:"+no);
		if(member_raw!=null){
			MemberDTO member=(MemberDTO)member_raw;
		recentvideoDAO.recent_delete(no);		
		List<Video_RecentVideoDTO> recent_list=recentvideoDAO.listVideo_recent(member.getNo());
		mv.addObject("recent_list",recent_list);		
		mv.setViewName("tftube/recentVideo");	
		}else{
			msg="로그인이 필요한 서비스 입니다. 로그인을 해주세요.";
			url="login";
			mv.addObject("msg",msg);
			mv.addObject("url",url);
			mv.setViewName("tftube/message");			
		}		
		return mv;		
	}
}
