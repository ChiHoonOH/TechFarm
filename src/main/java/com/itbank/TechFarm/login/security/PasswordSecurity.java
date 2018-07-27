package com.itbank.TechFarm.login.security;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class PasswordSecurity {
	
	public String createPassword(String rawPassword){
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); 
		PasswordEncoding passwordEncoding = new PasswordEncoding(passwordEncoder);
		return passwordEncoding.encode(rawPassword);
	}
	
	public boolean passwordConfirm(String rawPassword, String encodedPassword){
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); 
		PasswordEncoding passwordEncoding = new PasswordEncoding(passwordEncoder);
		
		if(passwordEncoding.matches(rawPassword, encodedPassword)){
			return true;
		}
		return false;
	}
}
