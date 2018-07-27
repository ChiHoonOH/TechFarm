package com.itbank.TechFarm.tftube;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.TechFarm.login.member.MemberDTO;
import com.itbank.TechFarm.tftube.dao.MyChannelDAO;

import com.itbank.TechFarm.tftube.dao.SubingDAO;
import com.itbank.TechFarm.tftube.dao.VideoDAO;

import com.itbank.TechFarm.tftube.dto.SubingDTO;
import com.itbank.TechFarm.tftube.dto.Subing_ChannelDTO;
import com.itbank.TechFarm.tftube.dto.VideoDTO;

public class SubController {	
	@Autowired
	private SubingDAO subingDAO;
	
	@Autowired
	private VideoDAO videoDAO;
	
	@RequestMapping(value="/subChannel", method=RequestMethod.GET)
	public ModelAndView likeVideo(HttpServletRequest arg0, 
			HttpServletResponse arg1) throws Exception {
		ModelAndView mv=new ModelAndView();
		HttpSession session=arg0.getSession();
		
		//common
		String no_raw=arg0.getParameter("no");//no of video
		int no=0;		
		if(no_raw!=null){
		no=Integer.parseInt(no_raw);}
		VideoDTO vdto=videoDAO.getVideo(no);
		//common
		
		//현재 로그인한 회원 정보
		MemberDTO cu_member=(MemberDTO)session.getAttribute("memberDTO");
				
		List<Subing_ChannelDTO> saved_subing_member=null;
		//현재 로그인한 회원의 구독 목록
		if(cu_member!=null){//로그인 된 상태라면
		saved_subing_member=subingDAO.get_subing_member(cu_member.getNo());
				 
		 //현재 로그인회원의 구독목록
		 }
		
		
		
		if(saved_subing_member!=null){//구독 목록이 있다면
		for(Subing_ChannelDTO dto:saved_subing_member){			
		if(vdto.getMember_no()==dto.getMember_no()){	//게시판 작성자의 이름과 목록중에 같은 것 		
		mv.addObject("subing_status",1);//목록에 현재 비디오를 등록한 사람이 포함 되어 있다면 1 아니면 0
		break;
		}else{
			mv.addObject("subing_status",0);
		}
		}
		}else{
					mv.addObject("subing_status",0);			
		}		
				
				//end of response
				
				
				//request
			
				String subing_member_no_raw=arg0.getParameter("subing_member_no");//이 비디오의 작성자 
				//필요하다면 따로 보내준다.
				//disabled인 상태에서 구독이 되도록 한다
				//평소에 null 누르면 값이 들어옴
				//작성자이름으로 구분할듯.
				String mode=arg0.getParameter("mode");
				SubingDTO sidto=null;
				//SubedDTO sddto=null;
				if(subing_member_no_raw!=null&&mode.equals("injection")){//구독 버튼을 눌렀을때
					int subing_member_no=Integer.parseInt(subing_member_no_raw);
				sidto=new SubingDTO();		
/*				String cu_channel=(String)mychannelDAO.getChannel(cu_member.getNo()).getChannel();//현재 로그인한 사람 정보,채널		
*/				/*sidto.setChannel(cu_channel);//로그인 한 사람 채널
*/				sidto.setMember_no(cu_member.getNo());	//현재 로그인한 사람 회원 번호
				sidto.setSubing_member_no(subing_member_no);//비디오 작성자	
				//다 읽어보진 않았지만 아마도 피구독 구독 값 설정중
				//sddto.setChannel(vdto.getChannel());
				//sddto.setMember_no(vdto.getMember_no());
				//sddto.setSubed_member_no(cu_member.getNo());
				
				subingDAO.insertSubing(sidto);//db에 넣기

				}else if(subing_member_no_raw!=null&&mode.equals("cancel")){			
					/*subingDAO.deleteSubing(vdto.getMember_no());
					subedDAO.deleteSubed(vdto.getMember_no());*/
				}
		mv.setViewName("tftube/videoView_subscribe");
		mv.addObject("vdto",vdto);
		return mv;
	}
}
