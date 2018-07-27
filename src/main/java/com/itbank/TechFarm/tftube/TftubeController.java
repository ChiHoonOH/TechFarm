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
import com.itbank.TechFarm.tftube.dao.VideoDAO;
import com.itbank.TechFarm.tftube.dto.MyChannelDTO;
import com.itbank.TechFarm.tftube.dto.VideoDTO;

@Controller
public class TftubeController {
	
	@Autowired
	private VideoDAO videoDAO;	
	@Autowired
	private MyChannelDAO mychannelDAO;
	
	
	@RequestMapping(value = "/tftube_main", method = RequestMethod.GET)
	public ModelAndView tftube_main(HttpServletRequest arg0, 
			HttpServletResponse arg1) throws Exception {
		ModelAndView mav=new ModelAndView();
		
		//local variable
		//Problems occur when you access another page directly without going through the main.
		HttpSession session=arg0.getSession();		
		
		List<VideoDTO> list=videoDAO.listVideo();		
		MemberDTO member=(MemberDTO)session.getAttribute("memberDTO");
		
		
		
		if(member!=null){
		MyChannelDTO mychan=mychannelDAO.getChannel(member.getNo());
		if(mychan==null){
			MyChannelDTO mydto=new MyChannelDTO();
			mydto.setMember_no(member.getNo());
			mydto.setChannel(member.getId());
			mychannelDAO.createChannel(mydto);
		}
		}			
		
	
		
		
		
		List<VideoDTO> list_music=videoDAO.listVideo_category("music");
		List<VideoDTO> list_sport=videoDAO.listVideo_category("sport");
		List<VideoDTO> list_game=videoDAO.listVideo_category("game");
		List<VideoDTO> list_comedy=videoDAO.listVideo_category("comedy");
		List<VideoDTO> list_movie=videoDAO.listVideo_category("movie");
		List<VideoDTO> list_news=videoDAO.listVideo_category("news/politics");
		List<VideoDTO> list_ani=videoDAO.listVideo_category("animation");	
				
		
		session.setAttribute("list",list);	
		session.setAttribute("list_music", list_music);
		session.setAttribute("list_sport", list_sport);
		session.setAttribute("list_game", list_game);
		session.setAttribute("list_comedy", list_comedy);
		session.setAttribute("list_movie", list_movie);
		session.setAttribute("list_news", list_news);
		session.setAttribute("list_ani", list_ani);
		mav.setViewName("tftube/main");
		
		return mav;
	}	
	
}
