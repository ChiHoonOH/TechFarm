package com.itbank.TechFarm.james;

import org.springframework.web.multipart.MultipartFile;

public class JamesDTO {
	private int num;
	private String id;
	private String password;
	
	private String from;
	private String to;
	private String subject;
	private String text;
	private String sentDate;
	private String folder;
	private String content;
	
	private MultipartFile sendFile;
	private MultipartFile receiveFile;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getSentDate() {
		return sentDate;
	}
	public void setSentDate(String sentDate) {
		this.sentDate = sentDate;
	}
	public String getFolder() {
		return folder;
	}
	public void setFolder(String folder) {
		this.folder = folder;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public MultipartFile getSendFile() {
		return sendFile;
	}
	public void setSendFile(MultipartFile sendFile) {
		this.sendFile = sendFile;
	}
	public MultipartFile getReceiveFile() {
		return receiveFile;
	}
	public void setReceiveFile(MultipartFile receiveFile) {
		this.receiveFile = receiveFile;
	}
	
}
