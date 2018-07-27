package com.itbank.TechFarm.contacts;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.TechFarm.login.member.MemberDTO;

@Controller
public class ContactsController {
	@Autowired
	private ContactsDAO contactsDAO;
	
	@RequestMapping(value = "/listContacts", method = RequestMethod.GET)
	public String listContacts(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("memberDTO"); 
		String id = memberDTO.getId();
		List<ContactsDTO> listContacts = contactsDAO.listContacts(id);
		String upPath = session.getServletContext().getRealPath("/resources/contacts/upload");
		model.addAttribute("upPath", upPath);
		model.addAttribute("listContacts", listContacts);
		return "contacts/listContacts";
	}
	
	@RequestMapping(value = "/addContact", method = RequestMethod.GET)
	public String addContact(Locale locale, Model model) {
		return "contacts/addContact";
	}
	@RequestMapping(value = "/addContact", method = RequestMethod.POST)
	public String addContactPro(ContactsDTO dto, HttpSession session, HttpServletRequest request, HttpServletResponse response){
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("memberDTO"); 
		dto.setId(memberDTO.getId());
		String filename = dto.getPhotoMultipart().getOriginalFilename();
		String upPath = session.getServletContext().getRealPath("/resources/contacts/upload");
		File directory = new File(upPath);
		if(!directory.exists()) directory.mkdirs();
		if(!filename.isEmpty()){
			UUID uuid = UUID.randomUUID();
			String savedName = uuid.toString()+"_"+filename;
			File file = new File(upPath, savedName);
			try{
				dto.getPhotoMultipart().transferTo(file);
				dto.setPhoto(savedName);
			}catch(IOException e){
				e.printStackTrace();
			}
			dto.setPhoto(savedName);
		}
		
		int res = contactsDAO.addContact(dto);
		return "redirect:listContacts";
	}
	@RequestMapping(value="/getContact", method = RequestMethod.GET)
	public String getContact(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		int no = Integer.parseInt(request.getParameter("no"));
		ContactsDTO dto = contactsDAO.getContact(no);
		model.addAttribute("dto", dto);
		return "contacts/getContact";
	}
	@RequestMapping(value="/editContact", method = RequestMethod.GET)
	public String editContact(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		int no = Integer.parseInt(request.getParameter("no"));
		ContactsDTO dto = contactsDAO.getContact(no);
		model.addAttribute("dto", dto);
		return "contacts/editContact";
	}
	@RequestMapping(value="/editContact", method = RequestMethod.POST)
	public String editContactPro(ContactsDTO dto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		int no = Integer.parseInt(request.getParameter("no"));
		dto.setNo(no);
		
		String filename = dto.getPhotoMultipart().getOriginalFilename();
		String upPath = session.getServletContext().getRealPath("/resources/contacts/upload");
		if(!filename.isEmpty()){
			ContactsDTO contactsDTO = contactsDAO.getContact(no);
			if(contactsDTO.getPhoto()!=null){
				File file2 = new File(upPath, contactsDTO.getPhoto());
				if(file2.exists()) file2.delete();
			}
			
			UUID uuid = UUID.randomUUID();
			String savedName = uuid.toString()+"_"+filename;
			File file = new File(upPath, savedName);
			try{
				dto.getPhotoMultipart().transferTo(file);
				dto.setPhoto(savedName);
			}catch(IOException e){
				e.printStackTrace();
			}
			dto.setPhoto(savedName);
		}
		
		int res = contactsDAO.editContact(dto);
		return "redirect:listContacts";
	}
	
	@RequestMapping(value="/deleteContact", method = RequestMethod.GET)
	public String deleteContact(HttpServletRequest request, HttpServletResponse response, HttpSession session){
		int no = Integer.parseInt(request.getParameter("no"));
		ContactsDTO dto = contactsDAO.getContact(no);
		int res = contactsDAO.deleteContact(no);
		if (res>0){
			String upPath = session.getServletContext().getRealPath("/resources/contacts/upload");
			if(dto.getPhoto()!=null) {
				File file = new File(upPath, dto.getPhoto());
				if(file.exists()){
					file.delete();
				}
			}
			
		}
		return "redirect:listContacts";
	}
	
}
