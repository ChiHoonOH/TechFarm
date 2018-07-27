package com.itbank.TechFarm.blog;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.itbank.TechFarm.blog.dao.Blog_BoardDAO;
import com.itbank.TechFarm.blog.dao.Blog_OptionDAO;
import com.itbank.TechFarm.blog.dto.Blog_BoardDTO;
import com.itbank.TechFarm.blog.dto.Blog_BoardReplyDTO;
import com.itbank.TechFarm.blog.dto.Blog_MakeBoardDTO;
import com.itbank.TechFarm.blog.dto.Blog_OptionDTO;
import com.itbank.TechFarm.login.member.MemberDTO;


@Controller
public class BlogBoardController {

	private static final Logger logger = LoggerFactory.getLogger(BlogBoardController.class);
	private ServletContext context;
	
	@Autowired
	private Blog_BoardDAO boardDAO;
	@Autowired 
	private Blog_OptionDAO optionDAO;
	
	HttpSession session = null;
	String msg = null;
	String url = null;
	
	@RequestMapping(value="/listBoard")
	public ModelAndView listBoard(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blog/listBoardMain");
		session = request.getSession();
		String title = request.getParameter("title");

		int boardno = ServletRequestUtils.getIntParameter(request, "boardno");
		
		int pageSize = 9; 
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * pageSize - (pageSize - 1);
		int endRow = startRow + pageSize - 1;
		int countRow = boardDAO.boardNumber(boardno);  
		
		if (endRow>countRow) endRow = countRow;
		int number = countRow - (currentPage-1) * pageSize;
		
		List<Blog_BoardReplyDTO> listBoard = boardDAO.listBoard(boardno,startRow,endRow);		
		
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
		session.setAttribute("listBoard", listBoard);
		mav.addObject("title",title);
		mav.addObject("boardno",boardno);
		return mav;
	}
	
	@RequestMapping(value="/insertBoard")
	public ModelAndView insertBoardForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		int boardno = ServletRequestUtils.getIntParameter(request, "boardno");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		mav.setViewName("blog/insertBoard");
		mav.addObject("boardno",boardno);
		mav.addObject("id",id);
		mav.addObject("title",title);
		return mav;
	}
	
	// 다중파일업로드
	  @RequestMapping(value = "/file_uploader_html5",
	                  method = RequestMethod.POST)
	  @ResponseBody
	  public String multiplePhotoUpload(HttpServletRequest request) {
	    // 파일정보
	    StringBuffer sb = new StringBuffer();
	    try {
	      // 파일명을 받는다 - 일반 원본파일명
	      String oldName = request.getHeader("file-name");
	      // 파일 기본경로 _ 상세경로
	      session = request.getSession();
	      String filePath = session.getServletContext().getRealPath("/")+"resources"+File.separator+"upload"+File.separator;
	      String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
	                          .format(System.currentTimeMillis()))
	                          .append(UUID.randomUUID().toString())
	                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
	      InputStream is = request.getInputStream();
	      OutputStream os = new FileOutputStream(filePath + saveName);
	      int numRead;
	      byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	      while ((numRead = is.read(b, 0, b.length)) != -1) {
	        os.write(b, 0, numRead);
	      }
	      os.flush();
	      os.close();
	      // 정보 출력
	      sb = new StringBuffer();
	      sb.append("&bNewLine=true")
	        .append("&sFileName=").append(oldName)
	      //.append("&sFileURL=").append("/TechFarm/resources/upload/")
	        //.append("&sFileURL=").append("http://52.79.140.54/TechFarm/resources/upload/")
	        .append("&sFileURL=").append(session.getServletContext().getContextPath()+"/resources"+File.separator+"upload"+File.separator)
	       //.append("&sFileURL=").append(filePath)
	        .append(saveName);
	      System.out.println("파일 존재 확인 : "+new File(filePath, saveName).exists());
	      System.out.println(session.getServletContext().getContextPath());

	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    return sb.toString();
	  }
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)

	public ModelAndView write(HttpServletRequest request) throws Exception {
	  ModelAndView mav = new ModelAndView("redirect:listBoard");
	  
	  Blog_BoardDTO dto = getBoardOption(request);
	
	  int res = boardDAO.insertboard(dto);
	  
	  mav.addObject("title",dto.getTitle());
	  mav.addObject("boardno",dto.getBoardno());
	 
	  return mav;
	}
	
		private Blog_BoardDTO getBoardOption(HttpServletRequest arg0) throws Exception{
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)arg0;
		MultipartFile mf = mr.getFile("file1");	
		String file1 = mf.getOriginalFilename();
		
		session = arg0.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/upload/");
		File file = new File(upPath,file1);
		
		if(file1.trim().equals("")){}
		else{
			mf.transferTo(file);
		}
		Blog_BoardDTO dto = new Blog_BoardDTO();
			
			dto.setId(arg0.getParameter("id"));
			dto.setArea(Integer.parseInt(arg0.getParameter("area")));
			dto.setSubject(arg0.getParameter("subject"));
			dto.setContent(arg0.getParameter("content"));
			dto.setFile1(file1);
			dto.setOpen(Integer.parseInt(arg0.getParameter("open")));
			dto.setBoardno(Integer.parseInt(arg0.getParameter("boardno")));
			dto.setTitle(arg0.getParameter("title"));
			
		return dto;
	}
		
	@RequestMapping(value="/viewBoard")
	public ModelAndView blogMake(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String mode = "view";
		
		int no = ServletRequestUtils.getIntParameter(request, "no");
		session = request.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/upload");
		boardDAO.updateReadcount(no);
		Blog_BoardDTO dto = boardDAO.getBoard(no);
		Blog_OptionDTO optionDTO = optionDAO.getBlog(dto.getId());
		List<Blog_MakeBoardDTO> list = boardDAO.listBoardTitle(dto.getId());
		session.setAttribute("optionDTO", optionDTO);
		session.setAttribute("list", list);
		
		String joinmode = request.getParameter("joinmode"); //외부에서 방문시에 방문수 올려주기
		if(joinmode != null){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		if(memberDTO != null){
			if(!memberDTO.getId().equals(dto.getId())){
				optionDAO.updateVisitornum(dto.getId());
				}
			}
		}
		
		//reply
		int pageSize = 9; 
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * pageSize - (pageSize - 1);
		int endRow = startRow + pageSize - 1;
		int countRow = boardDAO.replyNumber(no);  
		
		if (endRow>countRow) endRow = countRow;
		int number = countRow - (currentPage-1) * pageSize;
		
		List<Blog_BoardReplyDTO> listReply = boardDAO.listReply(no,startRow,endRow);		
		
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
		mav.addObject("no",no);
		mav.addObject("listReply",listReply);
		mav.addObject("boardDTO",dto);
		mav.addObject("title",dto.getTitle());
		mav.addObject("mode",mode);
		mav.addObject("upPath",upPath);
		mav.setViewName("blog/listBoardMain");
		return mav;
		}	
	
	@RequestMapping(value="/updateBoard" , method = RequestMethod.GET)
	public ModelAndView updateBoard(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		session = request.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/upload/");
		int no = ServletRequestUtils.getIntParameter(request, "no");
		String title = request.getParameter("title");
		mav.setViewName("blog/updateBoard");
		Blog_BoardDTO dto = boardDAO.getBoard(no);
		
		mav.addObject("upPath",upPath);
		mav.addObject("boardDTO",dto);
		mav.addObject("title",dto.getTitle());
		return mav;
		}
	
	@RequestMapping(value="/updateBoard" , method = RequestMethod.POST)
	public ModelAndView updateBoardPro(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:listBoard");
		String fileuse2 = request.getParameter("fileuse");
		int fileuse = 3;
		if(fileuse2 != null){
			fileuse = Integer.parseInt(fileuse2);
		}
		
		int no = ServletRequestUtils.getIntParameter(request, "no");
		Blog_BoardDTO dto = boardDAO.getBoard(no);
		String originfile1 = dto.getFile1();
		dto = getBoardOptionUpdate(request,dto);

		if(fileuse==1){
			session = request.getSession();
			String delpfPath = session.getServletContext().getRealPath("/resources/upload/"+originfile1);
			File delfile = new File(delpfPath);
			delfile.delete();
		}else if(fileuse==0){
			dto.setFile1(originfile1);
		}else{
			
		}
		
		int res = boardDAO.updateBoard(dto);
		if(res>0){
			
			String alertmode="updateboard";
			msg = "글이 수정되었습니다.";
			url = "listBoard";
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			mav.addObject("alertmode",alertmode);
			mav.setViewName("blog/message");
		}
		
		
		mav.addObject("boardno",dto.getBoardno());
		mav.addObject("title",dto.getTitle());
		return mav;
		}
	
		private Blog_BoardDTO getBoardOptionUpdate(HttpServletRequest arg0, Blog_BoardDTO dto) throws Exception{
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)arg0;
		MultipartFile mf = mr.getFile("file1");	
		String file1 = mf.getOriginalFilename();
		
		session = arg0.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/upload/");
		File file = new File(upPath,file1);
		
		if(file1.trim().equals("")){}
		else{
			mf.transferTo(file);
		}
		
			dto.setArea(Integer.parseInt(arg0.getParameter("area")));
			dto.setSubject(arg0.getParameter("subject"));
			dto.setContent(arg0.getParameter("content"));
			dto.setFile1(file1);
			dto.setOpen(Integer.parseInt(arg0.getParameter("open")));
			
		return dto;
	}
	
	@RequestMapping(value="/deleteBoard")
	public ModelAndView deleteBoard(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:listBoard");
		int no = ServletRequestUtils.getIntParameter(request, "no");
		Blog_BoardDTO dto = boardDAO.getBoard(no);
		String file1 = dto.getFile1();
		int res = boardDAO.deleteBoard(no);	
		
		if(res>0){
			HttpSession session = request.getSession();
			String delpfPath = session.getServletContext().getRealPath("/resources/upload/"+file1);
			File delfile = new File(delpfPath);
			delfile.delete();
			String alertmode="delboard";
			msg = "글이 삭제되었습니다.";
			url = "listBoard";
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			mav.addObject("alertmode",alertmode);
			mav.setViewName("blog/message");
		}
		
		mav.addObject("title",dto.getTitle());
		mav.addObject("boardno",dto.getBoardno());
		return mav;
	}
	
	@RequestMapping(value = "/insertReply")
	public ModelAndView insertReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
	  ModelAndView mav = new ModelAndView("redirect:viewBoard");
	  String id = request.getParameter("id");
	  int no = ServletRequestUtils.getIntParameter(request, "no");
	  String repcontent = request.getParameter("repcontent");
	  Blog_BoardReplyDTO dto = new Blog_BoardReplyDTO();
	  
	  String re_step_raw = request.getParameter("re_step");
	  String re_level_raw = request.getParameter("re_level");
	  int re_step = 0;
	  int re_level = 0;
	  
	  if(re_step_raw != null){
		  re_step = Integer.parseInt(re_step_raw);
	  }
	  if(re_level_raw != null){
		  re_level = Integer.parseInt(re_level_raw);
	  }
	  
	  int res = 0;
	  String mode = request.getParameter("mode"); //댓글(reply), 대댓글 구분(rereply)
	  Blog_OptionDTO optionDTO = optionDAO.getBlog(id);
	  if(optionDTO == null){
			dto.setProfile(null);
		}else{
			String profile = optionDTO.getProfile();
			dto.setProfile(profile);
		}
	  
	  dto.setId(id);
	  dto.setRe_step(re_step);			
	  dto.setRepcontent(repcontent);
	  dto.setNo(no);
	 
	  if(mode.equals("reply")){		
		  	dto.setRe_level(0);
			res=boardDAO.insertReply(dto);
			boardDAO.updateRe_step();
		}else{	 
			dto.setRe_level(1);
			res=boardDAO.insertReply(dto);
			boardDAO.updateRere_step(re_step);
		}
	  boardDAO.updateReplyNumber(no);
	  mav.addObject("no",no);
	  return mav;
	}
	
	@RequestMapping(value="/deleteReply")
	public ModelAndView deleteReply(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:viewBoard");
		int replyno = ServletRequestUtils.getIntParameter(request, "replyno");
		int no = ServletRequestUtils.getIntParameter(request, "no");
		int res = boardDAO.deleteReply(replyno);
		if(res>0){
			String alertmode="delreply";
			msg = "댓글이 삭제되었습니다.";
			url = "viewBoard";
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			mav.addObject("alertmode",alertmode);
			mav.setViewName("blog/message");
		}
		boardDAO.minusReplyNumber(no);
		mav.addObject("no",no);
		return mav;
	}
	
	@RequestMapping(value="/searchboard")
	public ModelAndView searchblog(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blog/listBoardMain");
		
		String mode = "search";
		String search_option = request.getParameter("search_option");
		String search_text = request.getParameter("search_text");
		
		List<Blog_BoardDTO> searchlist = boardDAO.listSearchBoard(search_option, search_text);
		
		mav.addObject("mode",mode);
		mav.addObject("searchlist",searchlist);
		mav.addObject("search_option",search_option);
		mav.addObject("search_text",search_text);
		return mav;
	}
	
	@RequestMapping(value="/imsiboard")
	public ModelAndView imsiboard(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blog/listBoardMain");
		
		String mode = "imsi";
		String id = request.getParameter("id");
		
		List<Blog_BoardDTO> imsilist = boardDAO.imsiBoard(id);
		
		mav.addObject("mode",mode);
		mav.addObject("imsilist",imsilist);
		return mav;
	}
}
