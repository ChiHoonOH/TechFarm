package com.itbank.TechFarm.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SearchController {
	
	@Autowired
	private SearchNaver sn;
	
	private String[] targets= {"webkr","news","encyc"};
	
	@RequestMapping(value = "/search.naver", method = RequestMethod.POST)
	public String search(HttpServletRequest request, HttpServletResponse response, Model model) {
		String query=request.getParameter("search");
		int pageNum=ServletRequestUtils.getIntParameter(request, "pagenum",0);
		pageNum=pageNum*10+1;
		int targetNum=ServletRequestUtils.getIntParameter(request, "targetnum",0);
		String target=targets[targetNum];
		List<Object> list=sn.search(target, query, String.valueOf(pageNum));
		Object total=(Object)list.get(0);
		Object time=(Object)list.get(1);
		model.addAttribute("targetnum", targetNum);
		model.addAttribute("result",list.subList(2, list.size()));
		model.addAttribute("time", time);
		model.addAttribute("total", total);
		model.addAttribute("search",query);
		return "search/searchresult";
	}
}
