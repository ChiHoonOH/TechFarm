package com.itbank.TechFarm.james;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itbank.TechFarm.login.member.MemberDTO;

@Controller
public class JamesController {
	@Autowired
	private JamesDAO jamesDAO;
	
	@RequestMapping(value="/listJames", method = RequestMethod.GET)
	public String listJames(PageMaker pageMaker, Model model, HttpServletRequest request, HttpSession session){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		JamesDTO dto = new JamesDTO();
		dto.setId(memberDTO.getId());
		dto.setPassword(memberDTO.getRawPassword());
		String folder="INBOX";
		if(request.getParameter("folder")!=null){
			folder=request.getParameter("folder");
		}
		dto.setFolder(folder);

		int count =0;
		pageMaker.setPage(pageMaker.getPage());
		pageMaker.setCount(jamesDAO.getCountJames(dto));
		
		List<JamesDTO> listJames = jamesDAO.listJames(dto, pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("listJames", listJames);
		return "james/listJames";
	}
	@RequestMapping(value="/sendJames", method = RequestMethod.GET)
	public String sendJames(Model model, HttpServletRequest request){
		String to = request.getParameter("to");
		if(to!=null){
			model.addAttribute("to", to);
		}
		return "james/sendJames";
	}
	
	@RequestMapping(value="/sendJames", method = RequestMethod.POST)
	public String sendJamesPro(Model model, JamesDTO dto, HttpServletRequest request, HttpSession session){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		dto.setId(memberDTO.getId());
		dto.setPassword(memberDTO.getRawPassword());
		int res = jamesDAO.sendJames(dto);
		return "redirect:listJames";
	}
	@RequestMapping(value="/getJames", method = RequestMethod.GET)
	public String getJames(Model model, JamesDTO dto, HttpServletRequest request, HttpSession session){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		dto.setId(memberDTO.getId());
		dto.setPassword(memberDTO.getRawPassword());
		dto.setFolder("INBOX");
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		JamesDTO jamesDTO = jamesDAO.getJames(dto);
		model.addAttribute("jamesDTO", jamesDTO);
		return "james/getJames"; 
	}
	@RequestMapping(value="/deleteJames", method=RequestMethod.GET)
	public String deleteJames(Model model, HttpServletRequest request, HttpSession session){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		JamesDTO dto = new JamesDTO();
		dto.setId(memberDTO.getId());
		dto.setPassword(memberDTO.getRawPassword());
		dto.setFolder("INBOX");
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		jamesDAO.deleteJames(dto);
		return "redirect:listJames";
	}
}
