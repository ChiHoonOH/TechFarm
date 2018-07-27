package com.itbank.TechFarm.myaccount;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itbank.TechFarm.blog.dao.Blog_BoardDAO;
import com.itbank.TechFarm.blog.dao.Blog_OptionDAO;
import com.itbank.TechFarm.blog.dto.Blog_OptionDTO;
import com.itbank.TechFarm.james.JamesUser;
import com.itbank.TechFarm.login.member.MemberDAO;
import com.itbank.TechFarm.login.member.MemberDTO;
import com.itbank.TechFarm.login.security.PasswordSecurity;
import com.itbank.TechFarm.tfPlusDAO.NewsProfileDAO;
import com.itbank.TechFarm.tfPlusDTO.NewsProfileDTO;
import com.itbank.TechFarm.tftube.dao.SubingDAO;
import com.itbank.TechFarm.tftube.dao.VideoDAO;
import com.itbank.TechFarm.tftube.dto.SubingDTO;
import com.itbank.TechFarm.tftube.dto.VideoDTO;

@Controller
public class MyAccountController {
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private VideoDAO videoDAO;
	
	@Autowired
	private SubingDAO subingDAO;
	
	@Autowired
	private JamesUser jamesUser;
	
	@Autowired
	private NewsProfileDAO newsProfileDAO;
	
	@Autowired
	private PasswordSecurity passwordSecurity;
	
	@Autowired
	private Blog_BoardDAO boardDAO;
	
	@Autowired
	private Blog_OptionDAO optionDAO;
	
	@RequestMapping(value = "/myAccount", method = RequestMethod.GET)
	public String myAccount(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("memberDTO");
		String profileId = memberDTO.getId();
		int member_no=memberDTO.getNo();
		List list = newsProfileDAO.tfPlusList(profileId);
		int myBoardNumber = boardDAO.myBoardNumber(profileId);
		int myReplyNumber = boardDAO.myReplyNumber(profileId);
		Blog_OptionDTO optionDTO = optionDAO.getBlog(profileId);
		NewsProfileDTO newsProfileDTO = newsProfileDAO.tfPlusNews(profileId);
		
		int myvideo=videoDAO.listVideo_member_no(member_no).size();		
		//구독정보		
		int subing_number=subingDAO.get_subing_member(member_no).size();	
		//구독자
		int subed_number=subingDAO.get_subed_member(member_no).size();
		
		
		model.addAttribute("tfPlusSize", list.size());
		model.addAttribute("tfPlusNews",newsProfileDTO);
		model.addAttribute("tfTubeMyVideo",myvideo);
		model.addAttribute("tfTubeSubing", subing_number);
		model.addAttribute("tfTubeSubed",subed_number);
		model.addAttribute("myBoardNumber",myBoardNumber);
		model.addAttribute("myReplyNumber",myReplyNumber);
		model.addAttribute("blogoptionDTO",optionDTO);
		return "myaccount/myaccountmain";
	}
	
	@RequestMapping(value = "/editMyInfo", method = RequestMethod.GET)
	public String editInfo(HttpServletRequest request, HttpServletResponse response) {
		return "myaccount/editInfo";
	}
	
	@RequestMapping(value = "/editMyPw", method = RequestMethod.GET)
	public String editPw(HttpServletRequest request, HttpServletResponse response) {
		return "myaccount/editPw";
	}
	
	@RequestMapping(value = "/editMyPw", method = RequestMethod.POST)
	public String checkCurrentPw(HttpServletRequest request, HttpSession session, Model model) {
		String passwd=request.getParameter("currentpasswd");
		MemberDTO dto=(MemberDTO)session.getAttribute("memberDTO");
		if(passwordSecurity.passwordConfirm(passwd, dto.getPasswd())){
			model.addAttribute("cid", 1);
		}else{
			model.addAttribute("cid", 2);
		}
		return "myaccount/editPw";
	}
	
	@RequestMapping(value = "/updateMyPw", method = RequestMethod.POST)
	public String updateCurrentPw(HttpServletRequest request, HttpSession session, Model model) {
		String passwd=request.getParameter("passwd");
		String checkpasswd=request.getParameter("checkpasswd");
		if(checkpasswd.equals(passwd)){
			MemberDTO dto=(MemberDTO)session.getAttribute("memberDTO");
			dto.setPasswd(passwordSecurity.createPassword(passwd));
			int res=memberDAO.editPw(dto);
			jamesUser.setPassword(dto.getId(), passwd);
			
			dto.setRawPassword(passwd);
			session.removeAttribute("memberDTO");
			session.setAttribute("memberDTO", dto);
			
		}else{
			model.addAttribute("cid", 1);
			return "myaccount/editPw";
		}
		return "redirect:myAccount";
	}
	
	@RequestMapping(value = "/editMyInfo", method = RequestMethod.POST)
	public String editInfo2(@Valid @ModelAttribute("inputInfo") MemberDTO dto, Errors errors,HttpSession session) {
		int res=memberDAO.editMember(dto);
		if(res==1){
			MemberDTO info=memberDAO.getMember(dto.getId());
			session.removeAttribute("memberDTO");
			session.setAttribute("memberDTO", info);
			return "redirect:myAccount";
		}else{
			return "redirect:editMyInfo";
		}
	}
	
	@RequestMapping(value = "/deleteMember", method = RequestMethod.GET)
	public String deleteMember(HttpServletRequest request, HttpSession session, Model model) {
		return "myaccount/deleteAccount";
	}
	
	@RequestMapping(value = "/deleteMember", method = RequestMethod.POST)
	public String checkCurrentPwForDelete(HttpServletRequest request, HttpSession session, Model model) {
		String passwd=request.getParameter("currentpasswd");
		MemberDTO dto=(MemberDTO)session.getAttribute("memberDTO");
		if(passwordSecurity.passwordConfirm(passwd, dto.getPasswd())){
			model.addAttribute("cid", 1);
			model.addAttribute("deletesentence", dto.getId()+"는 TechFarm을 탈퇴하겠습니다.");
		}else{
			model.addAttribute("cid", 2);
		}
		return "myaccount/deleteAccount";
	}
	
	@RequestMapping(value = "/deleteMyAccount", method = RequestMethod.POST)
	public String deleteMyAccount(HttpServletRequest request, HttpSession session, Model model) {
		MemberDTO dto=(MemberDTO)session.getAttribute("memberDTO");
		int res=memberDAO.deleteMember(dto.getNo());
		if(res==1){
			jamesUser.deleteUser(dto.getId());
			session.invalidate();
			return "home";
		}else{
			return "redirect:deleteMember";
		}
		
	}
}
