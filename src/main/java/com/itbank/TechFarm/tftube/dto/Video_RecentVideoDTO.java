package com.itbank.TechFarm.tftube.dto;

public class Video_RecentVideoDTO {
	
	private int no;
	private int member_no;	
	private String title;
	private String description;
	private String open;
	private String video_name;//tmp save	
	private int readcount;
	private String image;
	private int likep;//default 0
	private int unlikep; //default 0	
	private String uploaddate;
	private String channel;	
	private int recent_no;
	

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getVideo_name() {
		return video_name;
	}
	public void setVideo_name(String video_name) {
		this.video_name = video_name;
	}
	
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getLikep() {
		return likep;
	}
	public void setLikep(int likep) {
		this.likep = likep;
	}
	public int getUnlikep() {
		return unlikep;
	}
	public void setUnlikep(int unlikep) {
		this.unlikep = unlikep;
	}
	public String getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public int getRecent_no() {
		return recent_no;
	}
	public void setRecent_no(int recent_no) {
		this.recent_no = recent_no;
	}
	
	
}