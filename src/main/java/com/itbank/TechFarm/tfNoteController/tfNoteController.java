package com.itbank.TechFarm.tfNoteController;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.TechFarm.tfNoteDAO.NoteDAO;
import com.itbank.TechFarm.tfNoteDTO.NoteDTO;

@Controller
public class tfNoteController {
	
	@Autowired
	private NoteDAO noteDAO;
	
	/* ******************************************************************************** */
	private NoteDTO getNoteDTO(HttpServletRequest arg0) throws Exception{
		NoteDTO dto = new NoteDTO();
		dto.setTitle(arg0.getParameter("title"));
		dto.setContent(arg0.getParameter("content"));
		dto.setId(arg0.getParameter("id"));
		dto.setCbyte(Integer.parseInt(arg0.getParameter("cbyte")));
		return dto;
	}
	private NoteDTO getNoteDTO2(HttpServletRequest arg0) throws Exception{
		NoteDTO dto = new NoteDTO();
		dto.setTitle(arg0.getParameter("title"));
		dto.setContent(arg0.getParameter("content"));
		dto.setId(arg0.getParameter("id"));
		return dto;
	}
	/* ******************************************************************************** */
	
	@RequestMapping(value="/tfNoteIndex")
	public ModelAndView tfNoteIndex(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id"); 
		List result = noteDAO.listNote(id); 
		mav.setViewName("tfNote/index");
		mav.addObject("noteList", result);
		return mav;
	}
	
	@RequestMapping(value="/note_list")
	public ModelAndView listNote(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();
		String id = arg0.getParameter("id"); 
		List result = noteDAO.listNote(id);
		mav.setViewName("tfNote/note/list");
		mav.addObject("noteList", result);
		return mav;
	}
	
/*	@RequestMapping(value="/note_insert", method=RequestMethod.GET)
	public ModelAndView insertFormNote(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		return new ModelAndView("tfNote/note/insert");
	}*/
	
	@RequestMapping(value="/note_insert", method=RequestMethod.POST)
	public ModelAndView insertProNote(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		NoteDTO dto = getNoteDTO(arg0);
		int res = noteDAO.insertNote(dto);
		String id = dto.getId();
		return new ModelAndView("redirect:tfNoteIndex?id="+id);
	}
	


	@RequestMapping(value="/note_delete", method=RequestMethod.GET)
	public ModelAndView deleteFormNote(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();
		String num = arg0.getParameter("num");
		String id = arg0.getParameter("id");
		int res = noteDAO.deleteNote(Integer.parseInt(num));
		mav.setViewName("redirect:tfNoteIndex?id="+id);
		return mav;
	}
	
/*	@RequestMapping(value="/note_content")
	public ModelAndView note_content(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView();
		NoteDTO dto = new NoteDTO();
		int num = Integer.parseInt(arg0.getParameter("num"));
		dto = noteDAO.getNote(num);
		mav.setViewName("tfNote/note/content");
		mav.addObject("dto",dto);
		return mav;
	}*/
			

/*	@RequestMapping(value="/note_update", method=RequestMethod.GET)
	public ModelAndView updateFormNote(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		int num = Integer.parseInt(arg0.getParameter("num"));
		NoteDTO dto = noteDAO.getNote(num);
		return new ModelAndView("tfNote/note/update","noteDTO", dto);
	}	*/
	
	@RequestMapping(value="/note_update", method=RequestMethod.POST)
	public ModelAndView updateProNote(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		NoteDTO dto = getNoteDTO2(arg0);
		dto.setNum(Integer.parseInt(arg0.getParameter("num")));
		int res = noteDAO.updateNote(dto); 
		String id = dto.getId();
		return new ModelAndView("redirect:tfNoteIndex?id="+id);		
	}
	
}




