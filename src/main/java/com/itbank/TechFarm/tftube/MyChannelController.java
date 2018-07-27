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
import com.itbank.TechFarm.tftube.dao.MyChannelDAO;
import com.itbank.TechFarm.tftube.dao.SubingDAO;
import com.itbank.TechFarm.tftube.dao.VideoDAO;
import com.itbank.TechFarm.tftube.dto.MyChannelDTO;
import com.itbank.TechFarm.tftube.dto.SubingDTO;
import com.itbank.TechFarm.tftube.dto.Subing_ChannelDTO;
import com.itbank.TechFarm.tftube.dto.VideoDTO;



@Controller
public class MyChannelController {
	
	@Autowired
	private VideoDAO videoDAO;
	@Autowired
	private SubingDAO subingDAO;
	@Autowired
	private MyChannelDAO mychannelDAO;
	String msg=null,url=null;
	
	
	@RequestMapping(value="/createChannel")
	public ModelAndView createMychannel(HttpServletRequest arg0, 
			HttpServletResponse arg1) throws Exception {
		ModelAndView mv=new ModelAndView();	
		HttpSession session=arg0.getSession();
		MemberDTO member=(MemberDTO)session.getAttribute("memberDTO");
		
		MyChannelDTO dto=new MyChannelDTO();
		dto.setChannel(member.getId());
		dto.setMember_no(member.getNo());
		int res=mychannelDAO.createChannel(dto);
		if(res>0){
		mv.setViewName("redirect:tftube_main");
		}
		else{
		mv.setViewName("redirect:/");	
		}
		return mv;
	}
	
	
	@RequestMapping(value="/tftube_mychannel", method=RequestMethod.GET)
	public ModelAndView tftube_mychannel(HttpServletRequest arg0, 
			HttpServletResponse arg1) throws Exception {
		ModelAndView mv=new ModelAndView();
		
		HttpSession session=arg0.getSession();		
		MemberDTO member=(MemberDTO)session.getAttribute("memberDTO");
		
		String mem_no=arg0.getParameter("mem_no");//일반적으로 null member_no
		int member_no=0;	
		
		//접근 가능 루트 버튼
		if(member==null){
			msg="로그인이 필요한 서비스 입니다. 로그인을 해주세요.";
			url="login";
			mv.addObject("msg",msg);
			mv.addObject("url",url);
			mv.setViewName("tftube/message");
			return mv;
		}
		
		if(mem_no==null){
		member_no=member.getNo();
		}else{
		member_no=Integer.parseInt(mem_no);
		}
		
		//내 동영상 목록
		List<VideoDTO> video_by_member=videoDAO.listVideo_member_no(member_no);
		mv.addObject("video_by_member",video_by_member);
		
		//좋아요 표시한 동영상
		/*List<VideoDTO> like_list=videoDAO.listLike(member_no);*/
		
		//구독정보		
		List<Subing_ChannelDTO> subing_list=subingDAO.get_subing_member(member_no);
	
		//구독자
		List<Subing_ChannelDTO> subed_list=subingDAO.get_subed_member(member_no);
		
		
		mv.addObject("subing_list",subing_list);
		mv.addObject("subed_list",subed_list);
		
		mv.setViewName("tftube/mychannel");	
		
		
		return mv;		
	}

}
