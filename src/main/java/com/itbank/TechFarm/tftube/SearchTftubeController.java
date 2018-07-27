package com.itbank.TechFarm.tftube;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.TechFarm.tftube.dao.SearchTftubeDAO;
import com.itbank.TechFarm.tftube.dao.VideoDAO;
import com.itbank.TechFarm.tftube.dto.VideoDTO;

@Controller
public class SearchTftubeController {		
	
	
	@Autowired
	private SearchTftubeDAO searchDAO;
	
	String msg=null,url=null;	
	
	@RequestMapping(value="/tftube_search")
	public ModelAndView search_tftube(HttpServletRequest arg0, 
			HttpServletResponse arg1) throws Exception {
		ModelAndView mv=new ModelAndView();		
		String search=arg0.getParameter("search");
		String search_text=arg0.getParameter("search_text");
		
		List<VideoDTO> search_result=searchDAO.search_single(search, search_text);
		 
		mv.addObject("search_result",search_result);		
		mv.setViewName("tftube/searchResult");
		
		return mv;
	}
}
