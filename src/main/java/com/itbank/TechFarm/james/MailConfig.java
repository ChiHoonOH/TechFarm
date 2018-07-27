package com.itbank.TechFarm.james;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class MailConfig {
	@Value("${host}")
	private String host;
	
	public JavaMailSender mailSender(String username, String password){
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost(host);
		mailSender.setDefaultEncoding("utf-8");
		mailSender.setUsername(username);
		mailSender.setPassword(password);
		return mailSender;
	}
}
