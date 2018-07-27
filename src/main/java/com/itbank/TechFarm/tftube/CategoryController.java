package com.itbank.TechFarm.tftube;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.TechFarm.tftube.dao.LikeVideoDAO;
import com.itbank.TechFarm.tftube.dao.SubingDAO;
import com.itbank.TechFarm.tftube.dao.VideoDAO;
import com.itbank.TechFarm.tftube.dto.VideoDTO;

@Controller
public class CategoryController {		
	@Autowired
	private VideoDAO videoDAO;
	
	String msg=null,url=null;	
	
	@RequestMapping(value="/tftube_category", method=RequestMethod.GET)
	public ModelAndView tftube_category(HttpServletRequest arg0, 
			HttpServletResponse arg1) throws Exception {
		ModelAndView mv=new ModelAndView();
		String category=arg0.getParameter("category");		
		String[] category_array={
				 "movie",
				 "animation",
				 "car",
				 "music",
				 "animal",
				 "sports",
				 "travel/event",
				 "game",
				 "blog/person",
				 "comedy",
				 "entertainment",
				 "news/politics",
				 "nohow/style",
				 "education",
				 "technology",
				 "none_profit/social_movement"};
		
		
		List<VideoDTO> clist=null;

		int count=0;
		
		for(int i=0;i<category_array.length;i++){
			count++;
			if(category_array[i].equals(category)){
				clist=videoDAO.listVideo_category(category);break;}		
			
		}
		
		
		if(count>category_array.length+1){
			count=0;
			msg="존재하지 않는 카테고리 입니다.";
			url="tftube_main";
			mv.addObject("msg",msg);
			mv.addObject("url",url);
			mv.setViewName("tftube/message");	
			return mv;	
		}
		
		String Category=category.substring(0,1).toUpperCase()+category.substring(1,category.length());
		mv.addObject("category",Category);
		mv.addObject("clist",clist);		
		
		mv.setViewName("tftube/category");
		return mv;
	}
}