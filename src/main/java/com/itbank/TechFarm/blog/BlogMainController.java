package com.itbank.TechFarm.blog;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Array;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.TechFarm.blog.dao.Blog_BoardDAO;
import com.itbank.TechFarm.blog.dao.Blog_OptionDAO;
import com.itbank.TechFarm.blog.dto.Blog_BoardDTO;
import com.itbank.TechFarm.blog.dto.Blog_BoardReplyDTO;
import com.itbank.TechFarm.blog.dto.Blog_OptionDTO;
import com.itbank.TechFarm.login.member.MemberDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BlogMainController {
	
	private static final Logger logger = LoggerFactory.getLogger(BlogMainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired 
	private Blog_OptionDAO optionDAO;
	@Autowired
	private Blog_BoardDAO boardDAO;
	
	String msg=null;
	String url=null;
	
	@RequestMapping(value = "/blogmain", method = RequestMethod.GET)
	public  ModelAndView home(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		String mode = null;
		if(memberDTO != null){
			Blog_OptionDTO optionDTO =  optionDAO.getBlog(memberDTO.getId());
			if(optionDTO != null){
				 mode = "member";
				 session.setAttribute("optionDTO", optionDTO);
			}else{
				 mode = "membernoblog";
			}
		}else{
			mode = "guest";
		}
		
		 mav.setViewName("blogmain/index");
		 List<Blog_BoardDTO> newlist = optionDAO.listNewBoard();
		 List<Blog_BoardDTO> hotlist = optionDAO.listHotBoard();
		 List<String> hotprofile = optionDAO.listHotProfile();
		 List<String> newprofile = optionDAO.listNewProfile();
		 List<Blog_OptionDTO> hotblog = optionDAO.listHotBlog();
		 session.setAttribute("newlist", newlist);
		 session.setAttribute("hotlist", hotlist);
		 
		 session.setAttribute("hotprofile", hotprofile);
		 session.setAttribute("newprofile", newprofile);
		 session.setAttribute("hotblog", hotblog);
		session.setAttribute("membermode", mode);
		
		return mav;
	}
	
	@RequestMapping(value="/blogStart")
	public ModelAndView blogStart(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blogmain/index");
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		List<Blog_BoardDTO> newlist = optionDAO.listNewBoard();
		List<Blog_BoardDTO> hotlist = optionDAO.listHotBoard();
		List<String> hotprofile = optionDAO.listHotProfile();
		List<String> newprofile = optionDAO.listNewProfile();
		List<Blog_OptionDTO> hotblog = optionDAO.listHotBlog();
		String id = null;
		String mode = null;
		if(memberDTO != null){
			mode="member";
			id= memberDTO.getId();
			Blog_OptionDTO optionDTO =  optionDAO.getBlog(id);
			if(optionDTO == null){
				mode = "membernoblog";
			}
			//mav.addObject("optionDTO", optionDTO);
			session.setAttribute("optionDTO", optionDTO);
		}else{
			mode="guest";
		}
		session.setAttribute("hotblog", hotblog);
		session.setAttribute("newprofile", newprofile);
		session.setAttribute("hotprofile", hotprofile);
		session.setAttribute("hotlist", hotlist);
		session.setAttribute("newlist", newlist);
		session.setAttribute("membermode", mode);
		return mav;
	}
		
	@RequestMapping(value="/blogMake")
	public ModelAndView blogMake(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blogmain/makeBlog");
		return mav;
	}
	
	@RequestMapping(value="/blogMake2")
	public ModelAndView blogMake2(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blogmain/makeBlog2");
			
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
		String blogname = mr.getParameter("blogname");
		String nickname = mr.getParameter("nickname");
		String introduce = mr.getParameter("introduce");
		String headerword = mr.getParameter("headerword");
		
	/*	MultipartFile mf = mr.getFile("profile");
		String profile = mf.getOriginalFilename();
	
		HttpSession session = request.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/upload/profile");
		File file = new File(upPath,profile);
		if(profile.trim().equals("")){}
		else{
		mf.transferTo(file);
		}*/
		mav.addObject("blogname", blogname);
		mav.addObject("nickname", nickname);
		mav.addObject("introduce",introduce);
		mav.addObject("headerword",headerword);
		//mav.addObject("profile",profile);
		
		return mav;
	}
	
	@RequestMapping(value="/blogMake3")
	public ModelAndView blogMake3(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blogmain/makeBlog3");
		String blogname = request.getParameter("blogname");
		String nickname = request.getParameter("nickname");
		String introduce = request.getParameter("introduce");
		String headerword = request.getParameter("headerword");
		int layout = ServletRequestUtils.getIntParameter(request, "layout");

		mav.addObject("blogname", blogname);
		mav.addObject("nickname", nickname);
		mav.addObject("introduce",introduce);
		mav.addObject("layout",layout);
		mav.addObject("headerword",headerword);
		
		return mav;
	}
	
	@RequestMapping(value="/blogMakePro")
	public ModelAndView blogMakePro(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blogmain");
		Blog_OptionDTO dto = getBlogOption(request);
		int res = optionDAO.makeBlog(dto);
		
		if(res>0){
		HttpSession session = request.getSession();
		String basicPath = session.getServletContext().getRealPath("/resources/upload");
		String upPath = session.getServletContext().getRealPath("/resources/upload/"+dto.getId());
		File basicfolder = new File(basicPath);
		
		if(!basicfolder.exists()){
			basicfolder.mkdirs();
		}
		File mkfolder = new File(upPath);
		if(!mkfolder.exists()){
			mkfolder.mkdirs();
		}
		
		String pfinFile = session.getServletContext().getRealPath("/resources/images/skin/"+dto.getProfile());
		String pfoutFile = session.getServletContext().getRealPath("/resources/upload/"+dto.getId()+"/"+dto.getProfile());
		String hdinFile =  session.getServletContext().getRealPath("/resources/images/skin/"+dto.getHeader());
		String hdoutFile =  session.getServletContext().getRealPath("/resources/upload/"+dto.getId()+"/"+dto.getHeader());
		
		FileInputStream pforiginFile = new FileInputStream(pfinFile);
		FileOutputStream pfcopyFile = new FileOutputStream(pfoutFile);
		FileInputStream hdoriginFile = new FileInputStream(hdinFile);
		FileOutputStream hdcopyFile = new FileOutputStream(hdoutFile);
		FileCopyUtils.copy(pforiginFile, pfcopyFile);
		FileCopyUtils.copy(hdoriginFile, hdcopyFile);
		pfcopyFile.close();
		pforiginFile.close();
		hdcopyFile.close();
		hdoriginFile.close();
		
		Thread.sleep(5000);
		
		String alertmode="addblog";
		msg = "블로그가 성공적으로 생성되었습니다. 이제 나만의 블로그를 꾸며 보세요.";
		url = "blogmain";
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.addObject("alertmode",alertmode);
		mav.setViewName("blog/message");
		}
		
		return mav;
	}
	
	private Blog_OptionDTO getBlogOption(HttpServletRequest arg0) throws Exception{
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)arg0;
		
		/*String id = mr.getParameter("id");
		String blogname = mr.getParameter("blogname");
		String nickname = mr.getParameter("nickname");
		String introduce = mr.getParameter("introduce");
		String profile = mr.getParameter("profile");
		int layout = Integer.parseInt(mr.getParameter("layout"));
		String headerword = id+"님의 블로그에 오신걸 환영합니다";*/
		String skin = mr.getParameter("skin");
		int skinnum = Integer.parseInt(skin.substring(4));
		
		String header="hd_skin"+skinnum+".jpg";
		String profile="pf_skin"+skinnum+".jpg";
		String background = "bg_skin.jpg";
		
		/*MultipartFile mf = mr.getFile("background");
		MultipartFile mf2 = mr.getFile("header");
		String background = mf.getOriginalFilename();
		String header = mf2.getOriginalFilename();
		
		HttpSession session = arg0.getSession();
		String bgupPath = session.getServletContext().getRealPath("/resources/upload/background");
		String hdupPath = session.getServletContext().getRealPath("/resources/upload/header");
		
		File file = new File(bgupPath,background);
		File file2 = new File(hdupPath,header);
		
		if(background.trim().equals("")){}
		else if(header.trim().equals("")){}
		else{
			mf.transferTo(file);
			mf.transferTo(file2);
		}*/
		Blog_OptionDTO dto = new Blog_OptionDTO();
			
			String id = arg0.getParameter("id");
			dto.setId(id);
			String blogname = arg0.getParameter("blogname");
			if(blogname.trim()=="" || blogname.equals("")){
				blogname = id+" BLOG";
			}
			dto.setBlogname(blogname);
			dto.setLayout(Integer.parseInt(arg0.getParameter("layout")));
			String headerword=arg0.getParameter("headerword");
			if(headerword.trim()=="" || headerword.equals("")){
				headerword = "Welcome To "+id+" BLOG";
			}
			dto.setHeaderword(headerword);
			dto.setNickname(arg0.getParameter("nickname"));
			dto.setIntroduce(arg0.getParameter("introduce"));
			dto.setProfile(profile);
			dto.setBackground(background);
			dto.setHeader(header);
			
		return dto;
	}
	
	@RequestMapping(value="/areasearch")
	public ModelAndView areaSearch(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blogmain/areaBoard");
		HttpSession session = request.getSession();
		String[] areaArr1 = {"문학·책","영화","미술·디자인","공연·전시","음악","드라마","스타·연예인","만화·애니","방송"};
		String[] areaArr2 =	{"일상·생각","육아·결혼","애완·반려동물","좋은글·이미지","패션·미용","인테리어·DIY","상품리뷰","원예·재배"};
		String[] areaArr3 =	{"게임","스포츠","사진","자동차","취미","국내여행","세계여행","맛집"};
		String[] areaArr4 =	{"IT·컴퓨터","사회·정치","건강·의학","비즈니스·경제","어학·외국어","교육·학문"}; 
		int bigarea=0;
		
		String bigarea_str = request.getParameter("bigarea");
		
		if(bigarea_str!=""){
			bigarea = Integer.parseInt(bigarea_str);
		}
		String areamode = request.getParameter("areamode");
		List<Blog_BoardDTO> arealist = null;
		
		int pageSize = 7; 
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * pageSize - (pageSize - 1);
		int endRow = startRow + pageSize - 1;
		int countRow = 0;
		
		if(bigarea==1){
			countRow = optionDAO.areaboardNumber1(); 
		}else if(bigarea==2){
			countRow = optionDAO.areaboardNumber2();
		}else if(bigarea==3){
			countRow = optionDAO.areaboardNumber3();
		}else if(bigarea==4){
			countRow = optionDAO.areaboardNumber4();
		}
		 
		
		if (endRow>countRow) endRow = countRow;
		int number = countRow - (currentPage-1) * pageSize;
				
		
		if (countRow>0) {
			int pageCount = countRow/pageSize + (countRow%pageSize==0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage>pageCount) endPage = pageCount;			
			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("pageBlock", pageBlock);
			mav.addObject("pageCount", pageCount);			
		}
		
		if(bigarea==1){
			arealist = optionDAO.listAreaBoard1(startRow,endRow);
		}else if(bigarea==2){
			arealist = optionDAO.listAreaBoard2(startRow,endRow);
		}else if(bigarea==3){
			arealist = optionDAO.listAreaBoard3(startRow,endRow);
		}else if(bigarea==4){
			arealist = optionDAO.listAreaBoard4(startRow,endRow);
		}
		
		mav.addObject("bigarea",bigarea);
		mav.addObject("arealist",arealist);
		session.setAttribute("areamode", areamode);
		return mav;
	}
	
	@RequestMapping(value="/searchblog")
	public ModelAndView searchblog(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blogmain/searchBlog");
		HttpSession session = request.getSession();
		
		String search_option = request.getParameter("search_option");
		String search_text = request.getParameter("search_text");
		
		List<Blog_OptionDTO> searchlist = optionDAO.listSearchBlog(search_option, search_text);
		mav.addObject("searchlist",searchlist);
		mav.addObject("search_option",search_option);
		mav.addObject("search_text",search_text);
		return mav;
	}
	
}
