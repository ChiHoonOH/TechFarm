package com.itbank.TechFarm.blog;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
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
import com.itbank.TechFarm.blog.dao.Blog_NeighborDAO;
import com.itbank.TechFarm.blog.dao.Blog_OptionDAO;
import com.itbank.TechFarm.blog.dto.Blog_BoardDTO;
import com.itbank.TechFarm.blog.dto.Blog_BoardReplyDTO;
import com.itbank.TechFarm.blog.dto.Blog_MakeBoardDTO;
import com.itbank.TechFarm.blog.dto.Blog_NeighborDTO;
import com.itbank.TechFarm.blog.dto.Blog_OptionDTO;
import com.itbank.TechFarm.login.member.MemberDTO;


@Controller
public class MyBlogController {

	private static final Logger logger = LoggerFactory.getLogger(MyBlogController.class);
	
	@Autowired 
	private Blog_OptionDAO optionDAO;
	@Autowired
	private Blog_BoardDAO boardDAO;
	@Autowired
	private Blog_NeighborDAO neighborDAO;
	
	String msg=null;
	String url=null;
	
	@RequestMapping(value="/myBlog")
	public ModelAndView blogMake(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		mav.setViewName("blog/myBlog");
		String id = request.getParameter("id");
		Blog_OptionDTO dto = optionDAO.getBlog(id);
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		if(memberDTO != null){
			if(!memberDTO.getId().equals(id)){
				optionDAO.updateVisitornum(id);
			}
		}
		List<Blog_BoardDTO> myboardlist = boardDAO.listMyBoard(id);
		List<Blog_MakeBoardDTO> list = boardDAO.listBoardTitle(id);
		List<Blog_NeighborDTO> neighborlist = neighborDAO.neighborList(id);
		List<String> neighborprofile = neighborDAO.listNeighborProfile(id);
		
		session.setAttribute("neighborlist", neighborlist);
		session.setAttribute("neighborprofile", neighborprofile);
		session.setAttribute("myboardlist", myboardlist);
		session.setAttribute("list", list);
		session.setAttribute("optionDTO", dto);
		return mav;
	}
	
	@RequestMapping(value="/editBlog", method=RequestMethod.GET)
	public ModelAndView blogEdit(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blog/editBlogMain");
		String mode = request.getParameter("mode");
		
		if(mode.equals("board")){
			HttpSession session = request.getSession();
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			String id = memberDTO.getId();
			List<Blog_MakeBoardDTO> list = boardDAO.listBoardTitle(id);
			mav.addObject("list",list);
			
		}else if(mode.equals("neighbor")){
			HttpSession session = request.getSession();
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			String id = memberDTO.getId();
			List<Blog_NeighborDTO> neighborlist = neighborDAO.neighborList(id);
			List<String> neighborprofile = neighborDAO.listNeighborProfile(id);
			session.setAttribute("neighborlist", neighborlist);
			session.setAttribute("neighborprofile", neighborprofile);
		}
		
		mav.addObject("mode",mode);
		return mav;
	}
	
	@RequestMapping(value="/editBlog", method=RequestMethod.POST)
	public ModelAndView blogEditPro(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blog/	");
		String mode = request.getParameter("mode");
		HttpSession session = request.getSession();
		/*String id = request.getParameter("id");
		Blog_OptionDTO dto = optionDAO.getBlog(id);*/
		Blog_OptionDTO dto = (Blog_OptionDTO) session.getAttribute("optionDTO");
		int res=0;
		
		if(mode.equals("profile")){//profile , introduce
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			MultipartFile mf = mr.getFile("profile");
			String profile = mf.getOriginalFilename();
			String introduce = mr.getParameter("introduce");
			System.out.println(introduce);
			String pfupPath = session.getServletContext().getRealPath("/resources/upload/"+dto.getId());
			File file = new File(pfupPath,profile);
			if(profile.trim().equals("")){
				String originpf = dto.getProfile();
				dto.setProfile(originpf);
			}else{
				mf.transferTo(file);
				dto.setProfile(profile);
			}
			dto.setIntroduce(introduce);
			res = optionDAO.editBlog_pf_int(dto);
			Blog_BoardReplyDTO replydto = new Blog_BoardReplyDTO();
			replydto.setId(dto.getId());
			replydto.setProfile(dto.getProfile());
			int res2 = boardDAO.editReply_pf(replydto);
			
		}else if(mode.equals("layout")){//layout
			int layout = ServletRequestUtils.getIntParameter(request, "layout");
			dto.setLayout(layout);
			res = optionDAO.editBlog_layout(dto);
			
		}else if(mode.equals("skin")){//skin, background, header
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			String originpf = dto.getProfile();
			String originhd = dto.getHeader();
			String skin = mr.getParameter("skin");
			int skinnum = Integer.parseInt(skin.substring(4));
			String header="hd_skin"+skinnum+".jpg";
			String profile="pf_skin"+skinnum+".jpg";
			
			dto.setProfile(profile);
			dto.setHeader(header);

			res = optionDAO.editBlog_skin(dto);
			
			if(res>0){
			String delpfPath = session.getServletContext().getRealPath("/resources/upload/"+dto.getId()+originpf);
			String delhdPath = session.getServletContext().getRealPath("/resources/upload/"+dto.getId()+originhd);
			File delpffile = new File(delpfPath);
			File delhdfile = new File(delpfPath);
			
			delpffile.delete();
			delhdfile.delete();
			
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
			
			Blog_BoardReplyDTO replydto = new Blog_BoardReplyDTO();
			replydto.setId(dto.getId());
			replydto.setProfile(dto.getProfile());
			int res2 = boardDAO.editReply_pf(replydto);
			
			Thread.sleep(5000);
			}
		}else if(mode.equals("blog")){//headerword
			String headerword = request.getParameter("headerword");
			if(headerword.trim().equals("")){
				headerword="Welcome To "+dto.getId()+" BLOG";
			}
			dto.setHeaderword(headerword);
			res = optionDAO.editBlog_headerword(dto);
		}
		
		if(res>0){
			String alertmode="editblog";
			msg = "성공적으로 수정되었습니다.";
			url = "editBlog";
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			mav.addObject("alertmode",alertmode);
			mav.setViewName("blog/message");
		}
		
		mav.addObject("mode",mode);
		return mav;
	}
	
private Blog_OptionDTO getBlogOption(HttpServletRequest arg0) throws Exception{
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)arg0;
		
		String skin = mr.getParameter("skin");
		int skinnum = Integer.parseInt(skin.substring(4));
		System.out.println(skinnum);
		
		String header="hd_skin"+skinnum+".jpg";
		String profile="pf_skin"+skinnum+".jpg";
		String background = "bg_skin.jpg";
		if(skinnum>28){
			background = "bg_skin"+skinnum+".jpg";
		}
		
		Blog_OptionDTO dto = new Blog_OptionDTO();
			
			String id = arg0.getParameter("id");
			dto.setId(id);
			dto.setBlogname(arg0.getParameter("blogname"));
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
	
	@RequestMapping(value="/deleteBlog")
	public ModelAndView blogDelete(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String id = request.getParameter("id");
		
		int res = optionDAO.deleteBlog(id);
		if(res>0){
			int res2 = boardDAO.deleteAllmyBoard(id);
			
			HttpSession session = request.getSession();
			String delpfPath = session.getServletContext().getRealPath("/resources/upload/"+id);
			File delfile = new File(delpfPath);
			if(delfile.exists()){
				File[] innerFilelist = delfile.listFiles();
				for(File innerFile : innerFilelist){
					innerFile.delete();
				}
				delfile.delete();
			}else{
			}
		}
		return new ModelAndView("redirect:blogStart");
	}
	
	@RequestMapping(value="/makeBoardTitle", method=RequestMethod.GET)
	public ModelAndView makeBoardform(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blog/makeBoardTform");
		String mode = "board";
		mav.addObject("mode",mode);
		
		return mav;
	}
	
	@RequestMapping(value="/makeBoardTitle", method=RequestMethod.POST)
	public ModelAndView makeBoard(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:editBlog");
		int sideno = ServletRequestUtils.getIntParameter(request, "sideno");
		String title = request.getParameter("title");
		String id = request.getParameter("id");
		String mode = request.getParameter("mode");
		
		Blog_MakeBoardDTO mbdto = new Blog_MakeBoardDTO();
		mbdto.setId(id);
		mbdto.setTitle(title);
		mbdto.setSideno(sideno);
		int res = boardDAO.makeBoard(mbdto);
		if(res>0){
			String alertmode="addboardt";
			msg = "게시판이 성공적으로 생성되었습니다.";
			url = "editBlog";
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			mav.addObject("alertmode",alertmode);
			mav.setViewName("blog/message");
		}
		mav.addObject("mode",mode);
		
		return mav;
	}
	
	@RequestMapping(value="/editBoardTitle", method=RequestMethod.GET)
	public ModelAndView editBoardTform(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blog/editBoardTform");
		int boardno = ServletRequestUtils.getIntParameter(request, "boardno");
		Blog_MakeBoardDTO makeBoardDTO = boardDAO.getBoardTitle(boardno);
		mav.addObject("makeBoardDTO",makeBoardDTO);
		
		return mav;
	}
	
	@RequestMapping(value="/editBoardTitle", method=RequestMethod.POST)
	public ModelAndView editBoardT(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:editBlog");
		String mode = "board";
		String title = request.getParameter("title");
		int sideno = ServletRequestUtils.getIntParameter(request, "sideno");
		int boardno = ServletRequestUtils.getIntParameter(request, "boardno");
		Blog_MakeBoardDTO makeBoardDTO = boardDAO.getBoardTitle(boardno);
		makeBoardDTO.setSideno(sideno);
		makeBoardDTO.setTitle(title);
		int res = boardDAO.editBoardTitle(makeBoardDTO);
		if(res>0){
			String alertmode="editblog";
			msg = "성공적으로 수정되었습니다.";
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
