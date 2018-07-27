package com.itbank.TechFarm.blog;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.TechFarm.blog.dao.Blog_BoardDAO;
import com.itbank.TechFarm.blog.dao.Blog_NeighborDAO;
import com.itbank.TechFarm.blog.dao.Blog_OptionDAO;
import com.itbank.TechFarm.blog.dto.Blog_NeighborDTO;
import com.itbank.TechFarm.login.member.MemberDTO;

@Controller
public class BlogNeighborController {

private static final Logger logger = LoggerFactory.getLogger(BlogMainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	private Blog_NeighborDAO neighborDAO;

	String msg=null;
	String url=null;
	
	@RequestMapping(value="/addNeighbor")
	public ModelAndView addNeighbor(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		String myid = memberDTO.getId();
		Blog_NeighborDTO neighborDTO = new Blog_NeighborDTO();
		neighborDTO.setId(myid);
		neighborDTO.setNeighborid(id);
		int res = neighborDAO.addNeighbor(neighborDTO);
		if(res>0){
			String alertmode="addNeighbor";
			msg = id+"님을 이웃에 추가했습니다.";
			url = "myBlog";
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			mav.addObject("alertmode",alertmode);
			mav.setViewName("blog/message");
		}
		mav.addObject("id",id);
		return mav;
	}
	
	@RequestMapping(value="/deleteNeighbor")
	public ModelAndView deleteNeighbor(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		int neighborno = ServletRequestUtils.getIntParameter(request, "neighborno");
		String mode = "neighbor";
		int res = neighborDAO.deleteNeighbor(neighborno);
		if(res>0){
			String alertmode="delNeighbor";
			msg = "이웃 삭제완료";
			url = "editBlog";
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			mav.addObject("alertmode",alertmode);
			mav.setViewName("blog/message");
		}
		mav.addObject("mode",mode);
		return mav;
	}
}
