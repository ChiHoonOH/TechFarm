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
import com.itbank.TechFarm.tftube.dao.LikeVideoDAO;
import com.itbank.TechFarm.tftube.dao.SubingDAO;
import com.itbank.TechFarm.tftube.dao.VideoDAO;
import com.itbank.TechFarm.tftube.dto.VideoDTO;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

@Controller
public class LikedVideoController {
	@Autowired
	private LikeVideoDAO likevideoDAO;
	
	String msg=null,url=null;
	
	
	@RequestMapping(value="/likedVideo", method=RequestMethod.GET)
	public ModelAndView tftube_likedVideo(HttpServletRequest arg0, 
			HttpServletResponse arg1) throws Exception {
		ModelAndView mv=new ModelAndView();
		HttpSession session=arg0.getSession();
		MemberDTO member=(MemberDTO)session.getAttribute("memberDTO");
		
		if(member==null){
			msg="로그인이 필요한 서비스 입니다. 로그인을 해주세요.";
			url="login";
			mv.addObject("msg",msg);
			mv.addObject("url",url);
			mv.setViewName("tftube/message");
			return mv;			
		}
		
		int member_no=member.getNo();
		List<VideoDTO> like_all_list=likevideoDAO.like_member_list(member_no);		
		mv.addObject("like_all_list",like_all_list);
		mv.setViewName("tftube/likedVideo");		
		
		return mv;
	}
	
	@RequestMapping(value="/likedVideo_delete", method=RequestMethod.GET)
	public ModelAndView tftube_likedVideo_delete(HttpServletRequest arg0, 
			HttpServletResponse arg1) throws Exception {
		ModelAndView mv=new ModelAndView();
		HttpSession session=arg0.getSession();
		MemberDTO member=(MemberDTO)session.getAttribute("memberDTO");
		
		int no=0;
		String no_raw=arg0.getParameter("no");
		if(no_raw!=null){
			no=Integer.parseInt(no_raw);
		}
		
		
		if(member==null){
			msg="로그인이 필요한 서비스 입니다. 로그인을 해주세요.";
			url="login";
			mv.addObject("msg",msg);
			mv.addObject("url",url);
			mv.setViewName("tftube/message");
			return mv;			
		}
		
	
		
		int member_no=member.getNo();
		int res=likevideoDAO.like_delete(member_no, no);
		List<VideoDTO> like_all_list=likevideoDAO.like_member_list(member_no);		
		mv.addObject("like_all_list",like_all_list);		
		mv.setViewName("tftube/likedVideo");		
		
		return mv;
	}
	
	
	
}