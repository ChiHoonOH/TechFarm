package com.itbank.TechFarm.tfchat;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {
	@RequestMapping(value = "/tfchat_main", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "tfchat/tfchatmain";
	}
}
