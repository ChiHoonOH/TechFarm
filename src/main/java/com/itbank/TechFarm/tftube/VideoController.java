package com.itbank.TechFarm.tftube;

import java.io.File;

import java.text.DecimalFormat;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.TechFarm.login.member.MemberDTO;
import com.itbank.TechFarm.tftube.dao.LikeVideoDAO;
import com.itbank.TechFarm.tftube.dao.MyChannelDAO;
import com.itbank.TechFarm.tftube.dao.RecentVideoDAO;
import com.itbank.TechFarm.tftube.dao.ReplyDAO;
import com.itbank.TechFarm.tftube.dao.SubingDAO;
import com.itbank.TechFarm.tftube.dao.UnlikeVideoDAO;
import com.itbank.TechFarm.tftube.dao.VideoDAO;
import com.itbank.TechFarm.tftube.dto.LikeVideoDTO;
import com.itbank.TechFarm.tftube.dto.RecentVideoDTO;
import com.itbank.TechFarm.tftube.dto.ReplyDTOFormat;


import com.itbank.TechFarm.tftube.dto.SubingDTO;
import com.itbank.TechFarm.tftube.dto.UnlikeVideoDTO;
import com.itbank.TechFarm.tftube.dto.VideoDTO;
import com.itbank.TechFarm.tftube.java.Sha3;



 
@Controller
public class VideoController {
	
	@Autowired
	private VideoDAO videoDAO;
	@Autowired
	private ReplyDAO replyDAO;	
	@Autowired
	private RecentVideoDAO recentvideoDAO;
	@Autowired
	private MyChannelDAO mychannelDAO;
	@Autowired
	private SubingDAO subingDAO;	
	@Autowired
	private LikeVideoDAO likevideoDAO;
	@Autowired
	private UnlikeVideoDAO unlikevideoDAO;
	
	private String upPath_video=null;
	private String upPath_image=null;
	/*private HttpSession session=null;*///re_check Is it necessity?
	private String msg=null, url=null;
	
	private static HashMap<String, HashMap<String, Date>> map=new HashMap<String,HashMap<String,Date>>();
	
	@RequestMapping(value="/tftube_video_insert", method=RequestMethod.GET)
	public ModelAndView tftube_video_insertForm(HttpServletRequest arg0, 
								HttpServletResponse arg1) throws Exception {
		ModelAndView mv=new ModelAndView();	
		HttpSession session=arg0.getSession();
		MemberDTO member=(MemberDTO)session.getAttribute("memberDTO");
		if(member!=null){
		mv.setViewName("tftube/insertForm");}
		else{	
			msg="로그인이 필요한 서비스 입니다. 로그인을 해주세요.";
			url="login";
			mv.addObject("msg",msg);
			mv.addObject("url",url);
			mv.setViewName("tftube/message");				
		}	
		String upPath_video=session.getServletContext().getRealPath("/resources/tftube/uploadVideo");
		System.out.println("upPath_video:"+upPath_video);
		return mv;		
	}
	
	@RequestMapping(value="/tftube_video_insert", method=RequestMethod.POST)
	public ModelAndView tftube_video_insertPro(HttpServletRequest arg0, 
								HttpServletResponse arg1)  throws Exception  {
		
		ModelAndView mv=new ModelAndView();	
		HttpSession session=arg0.getSession();
		VideoDTO dto = new VideoDTO();		
		
		String upPath_image=session.getServletContext().getRealPath("/resources/tftube/uploadImage");
		String upPath_video=session.getServletContext().getRealPath("/resources/tftube/uploadVideo");
		System.out.println("upPath_video:"+upPath_video);
		System.out.println("upPath_img:"+upPath_image);
		
		MemberDTO member=(MemberDTO)session.getAttribute("memberDTO");
		
		
		if(member!=null){
		mv.setViewName("tftube/insertForm");}
		else{	msg="로그인이 필요한 서비스 입니다. 로그인을 해주세요.";
				url="login";
				mv.addObject("msg",msg);
				mv.addObject("url",url);
				mv.setViewName("tftube/message");	
		}
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)arg0;
		
		MultipartFile mf = mr.getFile("filename");
		
		String original_video_name = mf.getOriginalFilename();
		
		//메인을 거치지 않으면 nullpoint Exception
		//경로 설정
		File upPath_video_file=new File(upPath_video);
		if(!upPath_video_file.exists()){//해당경로가 존재하지 않는다면
			upPath_video_file.mkdirs();	
		}
		
		//위치 지정,파일이름 지정
		File original_video = new File(upPath_video,original_video_name);		
		
		//여기에 파일이 없으면 사용 할 수 없다.		
		
		mf.transferTo(original_video);
		
		Sha3 sha3=new Sha3();
		String video_sha3=sha3.Digest_Sha3(original_video);
		
		
		MultipartFile mf2 = mr.getFile("image");
		String original_image_name = mf2.getOriginalFilename();
		
		File upPath_image_file=new File(upPath_image);
		if(!upPath_image_file.exists()){//해당경로가 존재하지 않는다면
			upPath_image_file.mkdirs();			
		}
		
		File original_image = new File(upPath_image,original_image_name);
		
		mf2.transferTo(original_image);
		
		String image_sha3=sha3.Digest_Sha3(original_image);				
		//지워졌을때 문제가 발생한다. 사실은 그냥 영상 썸네일을 추출하는게 가장 좋음
		
		//db에서 목록 추출,그리고 그 목록들과 비교 
		
		List<VideoDTO> shaList=videoDAO.listVideo();
		for(VideoDTO shadto: shaList){
			if(video_sha3.equals(shadto.getVideo_name())){
				msg="업로드된 다른 동영상과 중복됩니다.";
				url="tftube_video_insert";
				mv.addObject("msg",msg);
				mv.addObject("url",url);
				mv.setViewName("tftube/message");
				original_video.delete();
				original_image.delete();
				return mv;
			}
		}		
		
		//게시
		String file_ex_video=original_video_name.substring(original_video_name.length()-4,original_video_name.length());
		String video_name=video_sha3+file_ex_video;
		//여기 string과 특정폴더에 있는 파일들의 이름 비교.
		String upPath_video_real=session.getServletContext().getRealPath("/resources/tftube/Video");
		System.out.println("upPath_video_real:"+upPath_video_real);
		File video_real=new File(upPath_video_real);
		if(!video_real.exists()){
			video_real.mkdirs();
		}
		File file=new File(upPath_video_real,video_name);
		original_video.renameTo(file);	
		
		String file_ex_image=original_image_name.substring(original_image_name.length()-4,original_image_name.length());	
		
		String image_name=image_sha3+file_ex_image;
		
		String upPath_image_real=session.getServletContext().getRealPath("/resources/tftube/Image");
		File image_real=new File(upPath_image_real);
		if(!image_real.exists()){
			image_real.mkdirs();
		}
		File image=new File(upPath_image_real,image_name);
		original_image.renameTo(image);
		 
		 
		 
		
		
			
		//sha3 까지 구하는 것만 여기서, 비교결과를 전송 insertform에 
		//컨트롤러를 거쳐도 다시 원래 정보가 남아 있게 하려면 어찌해야함?
		//문제 없으면 게시 mapping , 문제 있으면 messsage로 넘김
		
		MemberDTO memberdto=(MemberDTO)session.getAttribute("memberDTO");
		dto.setDescription(ServletRequestUtils.getStringParameter(arg0, "description"));
		dto.setMember_no(memberdto.getNo());
		//when !login but insert
		
		dto.setVideo_name(video_name);
		
		dto.setOpen(ServletRequestUtils.getStringParameter(arg0, "open"));
		dto.setTitle(ServletRequestUtils.getStringParameter(arg0, "title"));

		dto.setImage(image_name);		
		
		dto.setChannel(mychannelDAO.getChannel(memberdto.getNo()).getChannel());
		dto.setCategory(arg0.getParameter("category"));		
		
		int res =videoDAO.insertVideo(dto);	
		if(res>0){			
			mv.setViewName("redirect:tftube_main");			
		}
		else{
			msg="file upload failed.";
			url="tftube_video_insert";
			mv.setViewName("message");
			mv.addObject("msg",msg);
			mv.addObject("url",url);				
		}		
		return mv;
		
		
	}	
	
	
	@RequestMapping(value="/tftube_videoView", method=RequestMethod.GET)
	public ModelAndView tftube_videoView(HttpServletRequest arg0, 
								HttpServletResponse arg1) throws Exception {
		ModelAndView mv=new ModelAndView();
		HttpSession session=arg0.getSession();	
		Object member_object=session.getAttribute("memberDTO");
		MemberDTO member=null;
		if(member_object!=null){
		member=(MemberDTO)member_object;
		}
		
		
		/*if(member==null){			
			msg="로그인이 필요한 서비스 입니다. 로그인을 해주세요.";
			url="login";
			mv.addObject("msg",msg);
			mv.addObject("url",url);
			mv.setViewName("tftube/message");
			return mv;
		}*/
			
		//request no,like_status,unlike_status
		String no_raw=arg0.getParameter("no");//no of video
		//videoView or main
		int no=0;		//direct approach
		if(no_raw!=null){no=Integer.parseInt(no_raw);}
		else{
			return new ModelAndView("redirect:tftube_main");}
		VideoDTO vdto=videoDAO.getVideo(no);//a video's total information		
		mv.addObject("vdto",vdto);
		String video_name=vdto.getVideo_name();//video_name at present
		

	//**like**
		if(member!=null){
			int member_no=member.getNo();	
		String like_status_req_raw=arg0.getParameter("like_status");//like unlike 둘중 하나만 들어온다.
		String unlike_status_req_raw=arg0.getParameter("unlike_status");
		//새로 고침 했을때, 주소직접접근, main에서 넘어올때(except like button)
		//기존에 있던 like_status 값 들고오기.

		int like_status_req=2;
		int unlike_status_req=2;
	
		/*if(like_status==null)*/
		//기존 계정이 가지고 있던 like_status 값.
		//int like_status=0,unlike_status=0;		
		
		if(like_status_req_raw!=null){
		like_status_req=Integer.parseInt(like_status_req_raw);}
	
		if(unlike_status_req_raw!=null){
		unlike_status_req=Integer.parseInt(unlike_status_req_raw);}
	
	
		int like_db=likevideoDAO.likevideo_list_status(member_no, no);
		//결과가 뭐가 나올질 모르겠네(내생각 db 에있는값추출. 다만 1짜리 갯수
		int unlike_db=unlikevideoDAO.likevideo_list_ustatus(member_no, no);
	

		//지금 이 비디오에 이 아이디에 좋아요
		//no member_no video_name like status unlike	
		//현재 회원이 좋아요 누른 동영상 조회 
		//LikeVideoDTO lvdto_list=likevideoDAO.likevideo_list(member_no,no);
		//단, lvdto가 null인 경우도 있다.생각해보면 좋아요를 누르지 않으면 데이터가 없다.
					  
		  
		//insert준비

		
		LikeVideoDTO lvdto_insert=new LikeVideoDTO();	
		UnlikeVideoDTO ulvdto_insert=new UnlikeVideoDTO();
		lvdto_insert.setMember_no(member_no);
		lvdto_insert.setVideo_no(no); 
		ulvdto_insert.setMember_no(member_no);
		ulvdto_insert.setVideo_no(no);
		int res=0;
		//like_db=0;
		if(like_status_req!=like_db){
		//when like_disabled
		if(like_status_req==1){
		res=likevideoDAO.like_insert(lvdto_insert);//왜이걸 다르다고 생각했을꼬
		}else if(like_status_req==0){//when like
		res=likevideoDAO.like_delete(member_no,no);}
		}//꺼림칙한 조건
		 
		if(unlike_status_req!=unlike_db){
		if(unlike_status_req==1){			
		res=unlikevideoDAO.unlike_insert(ulvdto_insert);}
		else if(unlike_status_req==0){//when like			
		res=unlikevideoDAO.unlike_delete(member_no,no);}	
		}
		//좋아요 갯수 세기-제대로 한거 맞니?
		int count_like=likevideoDAO.likecount(no);
		int count_unlike=unlikevideoDAO.unlikecount(no);		
		
		//좋아요,싫어요 갯수 업데이트 dto.get
		VideoDTO vdto_blike=new VideoDTO();
		vdto_blike.setLikep(count_like);
		vdto_blike.setUnlikep(count_unlike);
		vdto_blike.setNo(no);
		int res_update_like=videoDAO.updateLike(vdto_blike);
		int like_db_out=likevideoDAO.likevideo_list_status(member_no, no);
		int unlike_db_out=unlikevideoDAO.likevideo_list_ustatus(member_no, no);
		if(res_update_like>0){
		mv.addObject("likep",count_like);
		mv.addObject("unlikep",count_unlike);		
		mv.addObject("like_status",like_db_out);
		mv.addObject("unlike_status",unlike_db_out);
		mv.setViewName("tftube/videoView");
		}else{
			msg="좋아요 갱신에 실패하였습니다.";
			url="videoView";
			mv.addObject("msg",msg);
			mv.addObject("url",url);
			mv.setViewName("tftube/message");			
		}		
		
		//end of like*/
		
		/*subscribe*/
		int current_video_member=vdto.getMember_no();		
		//db에 지금 접속한 애가 이 영상 주인을 팔로우 했냐?
		SubingDTO search_dto=new SubingDTO();
		search_dto.setMember_no(member_no);
		search_dto.setSubing_member_no(vdto.getMember_no());
		
		//not null -> 팔로우 null 안함
		
		//같은 경우
		if(member_no==current_video_member){
			mv.addObject("subing_status",2);
		}else if(subingDAO.select_subing(search_dto)!=null){			
			mv.addObject("subing_status",1);
		}else{
			mv.addObject("subing_status",0);
		}
		
		
				

		//적절한 버튼 나타남
		
		//request
		
		String req_subing_status_raw=arg0.getParameter("subing_status");
		int req_subing_status=0;//initialize(check)
		/*String channel=mychannelDAO.getChannel(member_no).getChannel();*/
		//버튼을 누르지 않으면 구독 구독중 실행 하지 않는다.
		if(req_subing_status_raw!=null){
		req_subing_status=Integer.parseInt(req_subing_status_raw);
	
		SubingDTO sidto=new SubingDTO();
		

		/*sidto.setChannel(channel);*/
		sidto.setMember_no(member_no);
		sidto.setSubing_member_no(vdto.getMember_no());
	
		//sddto.setChannel(channel);
		//sddto.setMember_no(vdto.getMember_no());
		//sddto.setSubed_member_no(member_no);
	
		if(req_subing_status==1){//구독이벤트			

			subingDAO.insertSubing(sidto);
			mv.addObject("subing_status",1);
			//subedDAO.insertSubed(sddto);						
		}else{
			subingDAO.deleteSubing(sidto);//내 아이디 vdto
			mv.addObject("subing_status",0);
			//내 아이디, vdto.delete
			//subedDAO.deleteSubed(sddto);
		}
		//조회하는 변수를 서로 다르게 준다면 
		}//end of null
		}
		/*end of subscribe*/
			
		//?
		session.setAttribute("video_no",no);//error and time lag
		
		Date today=new Date();//today				
		Long today_day=today.getTime()/1000/3600/24;
		
		/*Date date=map.get(vdto.getVideo_hash());//video's date clicked information*/		

		String ip=arg0.getRemoteAddr();
		System.out.println("ip:"+ip);
		
		//?
		//MemberDTO member=new MemberDTO();
		
		//start of hits' validity
		//private static HashMap<String, HashMap<String, Date>> map=new HashMap<String,HashMap<String,Date>>();
		Date date=null;
		HashMap<String,Date> log=map.get(vdto.getVideo_name());//object null		
		//map.values()->array []
		System.out.println("log:"+log);//not [](empty space)		
		
		if(log==null){
			videoDAO.hitUp(no);
		}else{
			date=log.get(ip);
			if(today_day-date.getTime()>1){
			videoDAO.hitUp(no);					
			}				
		}	
		
		HashMap<String,Date> log_space=new HashMap<String,Date>();
		log_space.put(ip, today);
		map.put(vdto.getVideo_name(),log_space);						
		// end of hits' validity
				
		//start of hits' format 
		
		DecimalFormat df=new DecimalFormat("#,##0");
		vdto=videoDAO.getVideo(no);//pull update information
		String readcount=df.format(vdto.getReadcount());
		mv.addObject("readcount",readcount);	
		//end of hits' format 
		
		// logged in member information at present
		
		
	//RecentVideo insert 		
		if(member!=null){
		RecentVideoDTO recent_dto=new RecentVideoDTO();
		int member_no=member.getNo();
		String last_video=recentvideoDAO.listVideo_last(member_no);	
		if(last_video==null){
			recent_dto.setMember_no(member_no);
			recent_dto.setVideo_name(video_name);			
			recentvideoDAO.insertRecent(recent_dto);			
		}else{
		if(!(last_video.equals(video_name))){
		recent_dto.setMember_no(member_no);
		recent_dto.setVideo_name(video_name);			
		recentvideoDAO.insertRecent(recent_dto);
		}
		}
		
		}
		//end of RecentVideo insert 		

		
		//ReplyList where=video		
		/*List<ReplyDTO> r_list=replyDAO.replyList_by_video(video_name);*/
		List<ReplyDTOFormat> r_list=replyDAO.replyList_by_video(video_name);
		String r_size=df.format(replyDAO.reply_number(video_name));
		
		//member_no
		
		//Reply writer
		/*String r_name=replyDAO.getName_by_video(vdto.getVideo_name());*/		

		
		//information of recent video
				
		//hits of reply
		mv.addObject("readcount",readcount);		
		//list of reply where video
		mv.addObject("r_list",r_list);
		//writer of reply

		/*mv.addObject("r_name",r_name);*/
		
		//size of reply
		mv.addObject("r_size",r_size);
		mv.addObject("no",no);
		
			
		mv.setViewName("tftube/videoView");			
		return mv;
		
	}
	
	@RequestMapping(value="/tftube_video_delete", method=RequestMethod.GET)
	public ModelAndView tftube_video_delete(HttpServletRequest arg0, 
								HttpServletResponse arg1) throws Exception {
		ModelAndView mv=new ModelAndView();
		int no=Integer.parseInt(arg0.getParameter("no"));
		System.out.println("video_delete_no:"+no);
		VideoDTO vdto=videoDAO.getVideo(no);
		String video_name=vdto.getVideo_name();
		//delete from tftube_video
		int res=videoDAO.deleteVideo(no);
		
		if(res>0){
			mv.setViewName("redirect:tftube_main");	
			//delete file
					
			File deletefile=new File(upPath_video,video_name);
			
			File deleteimage=new File(upPath_image,vdto.getImage());
			deletefile.delete();
			deleteimage.delete();
			//delete reply where video_name=video_name
			replyDAO.delete_reply_video_name(video_name);
		}
		else{
			msg="file delete failed.";
			url="tftube_videoView";
			mv.setViewName("message");
			mv.addObject("msg",msg);
			mv.addObject("url",url);				
		}		
		return mv;		
	}	
	

	@RequestMapping(value="/tftube_video_edit", method=RequestMethod.GET)
	public ModelAndView tftube_video_updateForm(HttpServletRequest arg0, 
								HttpServletResponse arg1) throws Exception {
		ModelAndView mv=new ModelAndView();	
		HttpSession session=arg0.getSession();
		int no=Integer.parseInt(arg0.getParameter("no"));
		MemberDTO member=(MemberDTO)session.getAttribute("memberDTO");
		if(member!=null){		
		mv.setViewName("tftube/editForm");
		mv.addObject("no",no);
		}
		else{	
			msg="로그인이 필요한 서비스 입니다. 로그인을 해주세요.";
			url="login";
			mv.addObject("msg",msg);
			mv.addObject("url",url);
			mv.setViewName("tftube/message");				
		}	
		return mv;		
	}
	
	@RequestMapping(value="/tftube_video_edit", method=RequestMethod.POST)
	public ModelAndView tftube_video_updatePro(HttpServletRequest arg0, 
								HttpServletResponse arg1)  throws Exception  {
		
		ModelAndView mv=new ModelAndView();	
		HttpSession session=arg0.getSession();
		VideoDTO dto = new VideoDTO();		
		int no=Integer.parseInt(arg0.getParameter("no"));
		MemberDTO member=(MemberDTO)session.getAttribute("memberDTO");
				
		if(member!=null){
		mv.setViewName("tftube/insertForm");}
		else{	msg="로그인이 필요한 서비스 입니다. 로그인을 해주세요.";
				url="login";
				mv.addObject("msg",msg);
				mv.addObject("url",url);
				mv.setViewName("tftube/message");	
		}
		
		
		 
		
		
		dto.setNo(no);
		dto.setDescription(ServletRequestUtils.getStringParameter(arg0, "description"));				
		dto.setOpen(ServletRequestUtils.getStringParameter(arg0, "open"));
		dto.setTitle(ServletRequestUtils.getStringParameter(arg0, "title"));				
		dto.setCategory(arg0.getParameter("category"));		
		
		int res =videoDAO.updateVideo(dto);
		if(res>0){			
			mv.setViewName("redirect:tftube_videoView?no="+no);			
		}
		else{
			msg="file update failed.";
			url="tftube_video_update";
			mv.setViewName("message");
			mv.addObject("msg",msg);
			mv.addObject("url",url);				
		}		
		return mv;
		
		
	}	
}
